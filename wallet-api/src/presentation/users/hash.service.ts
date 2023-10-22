// Framework
import { Injectable } from '@nestjs/common';

// External
import * as bcrypt from 'bcrypt';

@Injectable()
export class HashService {
  constructor() {}

  hashPassword = async (password: string): Promise<string> => {
    console.log('Hashing password');
    console.log(password);
    return bcrypt.hash(password, 10);
  };
}
