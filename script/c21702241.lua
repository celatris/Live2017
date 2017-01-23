--反目の従者
function c21702241.initial_effect(c)
	aux.AddEquipProcedure(c)
	--Equip limit
	local e2=Effect.CreateEffect(c)
	e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_EQUIP_LIMIT)
	e2:SetValue(1)
	c:RegisterEffect(e2)
	--damage
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(21702241,0))
	e3:SetCategory(CATEGORY_DAMAGE)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e3:SetRange(LOCATION_SZONE)
	e3:SetCode(EVENT_CONTROL_CHANGED)
	e3:SetCondition(c21702241.damcon)
	e3:SetTarget(c21702241.damtg)
	e3:SetOperation(c21702241.damop)
	c:RegisterEffect(e3)
end
function c21702241.damcon(e,tp,eg,ep,ev,re,r,rp)
	local tg=e:GetHandler():GetEquipTarget()
	return tg and eg:IsContains(tg)
end
function c21702241.damtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsRelateToEffect(e)
		and not e:GetHandler():IsStatus(STATUS_CHAINING) end
	local ec=e:GetHandler():GetEquipTarget()
	if not ec then return false end
	Duel.SetOperationInfo(0,CATEGORY_DAMAGE,nil,0,ec:GetControler(),ec:GetBaseAttack())
end
function c21702241.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) then return end
	local ec=c:GetEquipTarget()
	Duel.Damage(ec:GetControler(),ec:GetBaseAttack(),REASON_EFFECT)
end
