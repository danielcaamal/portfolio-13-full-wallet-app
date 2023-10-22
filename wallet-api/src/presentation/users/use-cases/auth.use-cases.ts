// Framework
import { Injectable } from '@nestjs/common';

// Use-cases
import { IAuthUseCases } from 'src/use-cases';
import { HashService } from '../hash.service';

@Injectable()
export class AuthUseCases implements IAuthUseCases {
  constructor(private readonly hashService: HashService) {}

  hashPassword(password: string): Promise<string> {
    return this.hashService.hashPassword(password);
  }
}
