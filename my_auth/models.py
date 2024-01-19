from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, PermissionsMixin

class UserManager(BaseUserManager):
	use_in_migration = True

	def create_user(self, email, password, **extra_fields):
		if not email:
			raise ValueError('Email is Required')
		user = self.model(email=self.normalize_email(email), **extra_fields)
		user.set_password(password)
		user.save(using=self._db)
		return user

	def create_superuser(self, email, password, **extra_fields):
		extra_fields.setdefault('is_superuser', True)
		extra_fields.setdefault('is_staff', True)
		extra_fields.setdefault('is_active', True)

		if extra_fields.get('is_superuser') is not True:
			raise ValueError('Superuser must have is_superuser = True')

		return self.create_user(email, password, **extra_fields)


class UserData(AbstractBaseUser, PermissionsMixin):
	email = models.EmailField(max_length=45, unique=True)
	name = models.CharField(max_length=45, default='')
	tel = models.CharField(max_length=20, default='')
	address = models.CharField(max_length=255, default='')
	is_active = models.BooleanField(default=True)
	is_staff = models.BooleanField(default=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)
	objects = UserManager()
	
	USERNAME_FIELD = 'email'
	REQUIRED_FIELDS = []

	def __str__(self):
		return self.email