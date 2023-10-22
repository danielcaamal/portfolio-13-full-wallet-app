// Domain
import { User } from 'src/domain';

// Infrastructure
import { PresenterSwagger } from 'src/infrastructure';

export class UserPresenter {
  @PresenterSwagger({ required: true, description: 'User id' })
  _id: string;

  @PresenterSwagger({ required: true, description: 'User first name' })
  firstName: string;

  @PresenterSwagger({ required: true, description: 'User last name' })
  lastName: string;

  @PresenterSwagger({ required: true, description: 'User employee number' })
  employeeNumber: number;

  @PresenterSwagger({ required: true, description: 'User last connection' })
  lastConnection: Date;

  @PresenterSwagger({ required: true, description: 'User position' })
  position: string;

  @PresenterSwagger({ required: true, description: 'User role' })
  role: string;

  constructor(user: User) {
    this._id = user._id;
    this.firstName = user.firstName;
    this.lastName = user.lastName;
    this.employeeNumber = user.employeeNumber;
    this.lastConnection = user.lastConnection;
    this.position = user.position;
    this.role = user.role;
  }
}
