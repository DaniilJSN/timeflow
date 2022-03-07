from fastapi import APIRouter, Depends
from ..utils import engine, get_session
from sqlmodel import Session, select, SQLModel, or_
from sqlalchemy.exc import NoResultFound
from ..models.user import User

router = APIRouter(prefix="/api/users", tags=["user"])
session = Session(engine)


@router.post("/")
async def post_user(
    user: User,
    session: Session = Depends(get_session),
):
    """Post new user"""
    statement = select(User).where(
        or_(User.username == user.username, User.id == user.id)
    )
    try:
        result = session.exec(statement).one()
        return False
    except NoResultFound:
        session.add(user)
        session.commit()
        session.refresh(user)
        return user


@router.get("/")
async def get_users(session: Session = Depends(get_session)):
    """Get list of all users"""
    statement = select(User)
    result = session.exec(statement).all()
    return result


@router.get("/{user_id}")
async def get_users(user_id, session: Session = Depends(get_session)):
    """Get user by id"""
    statement = select(User).where(User.id == user_id)
    result = session.exec(statement).one()
    return result


@router.put("/")
async def update_user(
    username: str = None,
    email: str = None,
    session: Session = Depends(get_session),
):
    """Update user email"""
    statement = select(User).where(User.username == username)
    user_to_update = session.exec(statement).one()
    user_to_update.email = email
    session.add(user_to_update)
    session.commit()
    session.refresh(user_to_update)
    return user_to_update


@router.delete("/")
async def delete_user(username: str = None, session: Session = Depends(get_session)):
    """Delete users"""
    statement = select(User).where(User.username == username)
    results = session.exec(statement)
    user_to_delete = results.one()
    session.delete(user_to_delete)
    session.commit()
    return True
