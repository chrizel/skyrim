import { changePerkLevel, getPerkLevel, resetActivePerkLevels } from "./app"; 
import * as data from "./data";

jest.mock("./data", () => ({
  perkTrees: [
    {
      name: "Test Tree",
      cname: "testtree",
      perks: [
        { name: "Parent A", pos: [0, 0], levels: 1, req: [0] }, // index 0
        { name: "Parent B", pos: [1, 1], levels: 1, req: [0] }, // index 1
        { name: "Child C", pos: [2, 2], levels: 1, req: [0], deps: [0, 1] } // index 2 (zależy od 0 i 1)
      ]
    }
  ]
}));

describe("Perk Logic - Multi-parent support", () => {
  
  beforeEach(() => {
  resetActivePerkLevels();
  });

  test("should NOT disable child perk if one parent is disabled but another remains active", () => {
    const tree = data.perkTrees[0];
    const parentA = tree.perks[0];
    const parentB = tree.perks[1];
    const childC = tree.perks[2];

    changePerkLevel(parentA, 1);
    changePerkLevel(parentB, 1);
    changePerkLevel(childC, 1);

    expect(getPerkLevel(childC)).toBe(1);

    changePerkLevel(parentA, -1);

    expect(getPerkLevel(parentA)).toBe(0);
    expect(getPerkLevel(childC)).toBe(1);
    expect(getPerkLevel(parentB)).toBe(1); 
  });

  test("should disable child perk if its LAST active parent is disabled", () => {
    const tree = data.perkTrees[0];
    const parentA = tree.perks[0];
    const parentB = tree.perks[1];
    const childC = tree.perks[2];

    changePerkLevel(parentA, 1);
    changePerkLevel(parentB, 0);
    changePerkLevel(childC, 1);

    changePerkLevel(parentA, -1);

    expect(getPerkLevel(parentA)).toBe(0);
    expect(getPerkLevel(parentB)).toBe(0);
    expect(getPerkLevel(childC)).toBe(0);
  });
});
