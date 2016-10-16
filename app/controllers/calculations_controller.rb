class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    text_array = @text.split

    character_count_without_spaces = 0
    occurances = 0
    text_array.each do |element|
      character_count_without_spaces += element.length
      if element.downcase == @special_word.downcase
        occurances += 1
      end
    end

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = character_count_without_spaces

    @word_count = text_array.count

    @occurrences = occurances

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    monthly_rate = @apr / 12 / 100
    num_months = @years * 12
    monthly_payment = @principal * \
                      (monthly_rate * (1 + monthly_rate)**num_months) / \
                      ((1 + monthly_rate)**num_months - 1)

    @monthly_payment = monthly_payment

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds / 1.minute
    @hours = @seconds / 1.hour
    @days = @seconds / 1.day
    @weeks = @seconds / 1.week
    @years = @seconds / 1.year

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = "Replace this string with your answer."

    @count = "Replace this string with your answer."

    @minimum = "Replace this string with your answer."

    @maximum = "Replace this string with your answer."

    @range = "Replace this string with your answer."

    @median = "Replace this string with your answer."

    @sum = "Replace this string with your answer."

    @mean = "Replace this string with your answer."

    @variance = "Replace this string with your answer."

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
