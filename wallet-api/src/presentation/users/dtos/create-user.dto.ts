import {
  IsEmail,
  IsEnum,
  IsNumber,
  IsOptional,
  IsString,
  MaxLength,
} from 'class-validator';
import { USER_ROLES_ENUM, USER_STATUS_ENUM, User } from 'src/domain';
import { PresenterSwagger } from 'src/infrastructure';

export class CreateUserDto {
  @PresenterSwagger({ required: true, description: 'User First name' })
  @IsString()
  @MaxLength(50)
  firstName: string;

  @PresenterSwagger({ required: true, description: 'User Last name' })
  @IsString()
  @MaxLength(50)
  lastName: string;

  @PresenterSwagger({ required: true, description: 'Employee number' })
  @IsNumber()
  employeeNumber: number;

  @PresenterSwagger({ required: true, description: 'User Email' })
  @IsEmail()
  email: string;

  @PresenterSwagger({ required: true, description: 'User Password' })
  @IsString()
  @MaxLength(50)
  password: string;

  @PresenterSwagger({ required: false, description: 'User Position' })
  @IsOptional()
  @IsString()
  @MaxLength(50)
  position?: string;

  @PresenterSwagger({
    required: false,
    description: 'User Role',
    enum: USER_ROLES_ENUM,
  })
  @IsOptional()
  @IsEnum(USER_ROLES_ENUM)
  role?: USER_ROLES_ENUM;

  static createUserDtoToUser = (createUser: CreateUserDto): User => {
    return {
      firstName: createUser.firstName,
      lastName: createUser.lastName,
      employeeNumber: createUser.employeeNumber,
      email: createUser.email,
      password: createUser.password,
      position: createUser.position || '',
      role: createUser.role || USER_ROLES_ENUM.EXTERNAL,
      token: '',
      lastConnection: undefined,
      status: USER_STATUS_ENUM.ACTIVE,
      loginCodeVerification: '',
      loginCodeExpiration: '',
      updatedAt: new Date(),
      createdAt: new Date(),
      isActive: true,
    };
  };
}
