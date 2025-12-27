from django.shortcuts import render
from .models import Expense
from django.contrib.auth.decorators import login_required

@login_required
def expense_list(request):
    # Get expenses for the logged-in user
    expenses = Expense.objects.filter(user=request.user).order_by('-date')
    return render(request, 'expenses/expense_list.html', {'expenses': expenses})
