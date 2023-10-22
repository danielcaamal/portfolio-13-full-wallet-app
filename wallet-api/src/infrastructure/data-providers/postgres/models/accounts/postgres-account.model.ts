// External
import { Column, Entity, JoinColumn, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

// Domain
import { Account, User } from 'src/domain';
import { PostgresUser } from '../users';

@Entity({ name: 'users' })
export class PostgresAccount implements Account {
  @PrimaryGeneratedColumn('uuid', { name: '_id' })
  _id?: string;

  @Column({ nullable: false, length: 255 })
  description: string;

  @Column({ nullable: false, type: 'decimal' })
  amount: number;

  @Column({ nullable: false, length: 255 })
  icon: string;

  @Column({ nullable: false, length: 7 })
  color: string;

  @Column({ nullable: false, default: true, type: 'boolean' })
  includeInBalance: boolean;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  createdAt: Date;

  @Column({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  updatedAt: Date;

  @ManyToOne(() => PostgresUser, (User) => User.account, { cascade: true })
  @JoinColumn()
  user: User;
}
