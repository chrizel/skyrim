import { BitArray } from "./bitarray";

describe("BitArray", () => {
  test("get and set", async () => {
    expect(new BitArray(1)).toBeTruthy();

    let b = new BitArray(3);
    expect(b.get(0)).toBe(false);
    b.set(0, true);
    expect(b.get(0)).toBe(true);

    expect(b.get(1)).toBe(false);
    expect(b.get(2)).toBe(false);

    b.set(1, true);
    expect(b.get(0)).toBe(true);
    expect(b.get(1)).toBe(true);
    expect(b.get(2)).toBe(false);

    b.set(0, false);
    expect(b.get(0)).toBe(false);
    expect(b.get(1)).toBe(true);
    expect(b.get(2)).toBe(false);

    b = new BitArray(32);
    expect(b.get(31)).toBe(false);
    b.set(31, true);
    expect(b.get(31)).toBe(true);

    b = new BitArray(34);
    expect(b.get(32)).toBe(false);
    b.set(32, true);
    expect(b.get(32)).toBe(true);
  });

  test("toString", async () => {
    let b = new BitArray(32);
    expect(b.toString()).toBe("0");
    b.set(0, true);
    expect(b.toString()).toBe("1");
    b.set(20, true);
    expect(b.toString()).toBe("mh35");

    b = new BitArray(64);
    b.set(0, true);
    b.set(20, true);
    expect(b.toString()).toBe("mh35,0");
    b.set(32, true);
    b.set(52, true);
    expect(b.toString()).toBe("mh35,mh35");
    b.set(0, false);
    b.set(20, false);
    expect(b.toString()).toBe("0,mh35");
  });

  test("parse", async () => {
    let b = new BitArray(64);
    b.parse("0,mh35");
    expect(b.get(0)).toBe(false);
    expect(b.get(20)).toBe(false);
    expect(b.get(32)).toBe(true);
    expect(b.get(52)).toBe(true);

    b.parse("mh35,0,mh35");
    expect(b.get(0)).toBe(true);
    expect(b.get(20)).toBe(true);
    expect(b.get(32)).toBe(false);
    expect(b.get(52)).toBe(false);
  });
});