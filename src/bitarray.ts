const BITS = 32;
const STRING_SEPARATOR = ",";

export class BitArray {

  size: number;
  data: number[];

  constructor(size: number) {
    this.size = size;
    this.data = new Array(Math.ceil(size / BITS));
    this.data.fill(0);
  }

  get(index: number): boolean {
    if (Math.abs(index) >= this.size) {
      throw `index ${index} beyond size ${this.size}`;
    }
    const i = index % BITS;
    const j = Math.floor(index / BITS);
    return (this.data[j] & (1 << i)) !== 0;
  }

  set(index: number, value: boolean): void {
    if (Math.abs(index) >= this.size) {
      throw `index ${index} beyond size ${this.size}`;
    }
    const i = index % BITS;
    const j = Math.floor(index / BITS);
    if (value) {
      this.data[j] |= 1 << i;
    } else {
      this.data[j] &= ~(1 << i);
    }
  }

  toString(): string {
    let result = "";

    for (const number of this.data) {
      if (result.length) {
        result += STRING_SEPARATOR;
      }
      result += number.toString(36);
    }

    return result;
  }

  parse(str: string): void {
    const numbers = str.split(STRING_SEPARATOR);
    let i = 0;
    while (i < this.data.length) {
      if (i < numbers.length) {
        this.data[i] = parseInt(numbers[i], 36);
      } else {
        this.data[i] = 0;
      }
      i++;
    }
  }

}