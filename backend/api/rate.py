from fastapi import APIRouter, Depends
from ..utils import engine, get_session
from sqlmodel import Session, select, SQLModel
from sqlalchemy.exc import NoResultFound
from ..models.rate import Rate
from datetime import datetime

router = APIRouter(prefix="/api/rates", tags=["rate"])
session = Session(engine)


# Post new rate
@router.post("/")
async def rate(
    rate: Rate,
    session: Session = Depends(get_session),
):
    statement = (
        select(Rate)
        .where(Rate.year == rate.year)
        .where(Rate.month == rate.month)
        .where(Rate.user_id == rate.user_id)
        .where(Rate.client_id == rate.client_id)
    )
    try:
        result = session.exec(statement).one()
        return False
    except NoResultFound:
        session.add(rate)
        session.commit()
        return True


# Get rate
@router.get("/")
async def read_rates(
    session: Session = Depends(get_session),
):
    statement = select(Rate)
    result = session.exec(statement).all()
    return result


# Activate rate
@router.put("/{rate_id}/activate")
async def activate_rate(
    rate_id: str,
    session: Session = Depends(get_session),
):
    statement = select(Rate).where(Rate.id == rate_id)
    rate_to_activate = session.exec(statement).one()
    rate_to_activate.is_active = True
    rate_to_activate.updated_at = datetime.now()
    session.add(rate_to_activate)
    session.commit()
    session.refresh(rate_to_activate)
    return rate_to_activate


# Deactivate rate
@router.put("/{rate_id}/deactivate")
async def deactivate_rate_id(
    rate_id: str = None,
    session: Session = Depends(get_session),
):
    statement = select(Rate).where(Rate.id == rate_id)
    rate_id_to_deactivate = session.exec(statement).one()
    rate_id_to_deactivate.is_active = False
    rate_id_to_deactivate.updated_at = datetime.now()
    session.add(rate_id_to_deactivate)
    session.commit()
    session.refresh(rate_id_to_deactivate)
    return rate_id_to_deactivate


# Update rates
@router.put("/")
async def update_rates(
    user_id: str = None,
    client_id: str = None,
    new_daily_value: str = None,
    session: Session = Depends(get_session),
):
    statement = (
        select(Rate).where(Rate.user_id == user_id).where(Rate.client_id == client_id)
    )
    rate_to_update = session.exec(statement).one()
    rate_to_update.daily_value = new_daily_value
    session.add(rate_to_update)
    session.commit()
    session.refresh(rate_to_update)
    return True
