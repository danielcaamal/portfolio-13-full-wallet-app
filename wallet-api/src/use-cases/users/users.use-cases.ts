// Domain
import { User } from 'src/domain';

export abstract class IUsersUseCases {
  abstract findAll(): Promise<User[]>;
  abstract findByEmail(email: string): Promise<User>;
  abstract create(user: User): Promise<User>;
}
