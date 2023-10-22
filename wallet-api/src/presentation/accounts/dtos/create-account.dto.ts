import { IsBoolean, IsHexColor, IsNumber, IsString, MaxLength } from 'class-validator';
import { Account } from 'src/domain';
import { PresenterSwagger } from 'src/infrastructure';

export class CreateAccountDto {
  @PresenterSwagger({ required: true, description: 'Account amount' })
  @IsNumber()
  amount: number;

  @PresenterSwagger({ required: true, description: 'Account color' })
  @IsHexColor()
  color: string;

  @PresenterSwagger({ required: true, description: 'Account description' })
  @IsString()
  @MaxLength(255)
  description: string;

  @PresenterSwagger({ required: true, description: 'Account icon' })
  @IsString()
  @MaxLength(255)
  icon: string;

  @PresenterSwagger({
    required: true,
    description: 'Account include in balance',
  })
  @IsBoolean()
  includeInBalance: boolean;

  static createAccountDtoToAccount = (account: CreateAccountDto): Account => {
    return {
      amount: account.amount,
      color: account.color,
      description: account.description,
      createdAt: new Date(),
      icon: account.icon,
      includeInBalance: account.includeInBalance,
      updatedAt: new Date(),
      user: undefined
    };
  };
}
