// External
import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

// Domain
import { Account, USER_ROLES_ENUM, USER_STATUS_ENUM, User } from 'src/domain';

@Entity({ name: 'users' })
export class PostgresUser implements User {
  @PrimaryGeneratedColumn('uuid', { name: '_id' })
  _id?: string;

  @Column({ nullable: false, length: 50 })
  firstName: string;
  
  @Column({ nullable: false, length: 50 })
  lastName: string;
  
  @Column({ nullable: false, type: 'int' })
  employeeNumber: number;
  
  @Column({ nullable: false, unique: true, length: 50 })
  email: string;
  
  @Column({ nullable: false, length: 255 })
  password: string;
  
  @Column({ nullable: false, length: 255 })
  position: string;
  
  @Column({
    nullable: false,
    enum: USER_ROLES_ENUM,
    default: USER_ROLES_ENUM.EXTERNAL,
  })
  role: USER_ROLES_ENUM;
  
  @Column({ nullable: true })
  token: string;
  
  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  lastConnection: Date;
  
  @Column({
    nullable: true,
    enum: USER_STATUS_ENUM,
    default: USER_STATUS_ENUM.ACTIVE,
  })
  status: USER_STATUS_ENUM;
  
  @Column()
  loginCodeVerification: string;
  
  @Column()
  loginCodeExpiration: string;
  
  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  createdAt: Date;
  
  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updatedAt: Date;

  account: Account;
}
