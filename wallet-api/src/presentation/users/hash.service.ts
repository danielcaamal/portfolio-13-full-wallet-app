// Framework
import { Injectable } from '@nestjs/common';

// External
import * as bcrypt from 'bcrypt';

@Injectable()
export class HashService {
  constructor() {}

  hashPassword = async (password: string): Promise<string> => {
    return bcrypt.hash(password, 10);
  };
}
