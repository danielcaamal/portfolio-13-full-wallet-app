export abstract class IAuthUseCases {
  abstract hashPassword(password: string): Promise<string>;
}
