class UserBadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test

    assign_badges
  end

  private

  def assign_badges
    return unless @test_passage.success?

    Badge.all.each do |badge|
      send(badge.rule_name, badge)
    end
  end

  def category_rule(badge)
    value = badge.value.to_i

    return if value != @test.category_id

    test_ids = Test.with_questions.where(category_id: value).pluck(:id)
    @test_passage.badges << badge if @user.passed_tests?(test_ids)
  end

  def first_attempt_rule(badge)
    if TestPassage.where.not(id: @test_passage.id).where(user_id: @test_passage.user_id,
                                                         test_id: @test_passage.test_id).blank?
      @test_passage.badges << badge
    end
  end

  def level_rule(badge)
    value = badge.value.to_i

    return if value != @test.level

    test_ids = Test.with_questions.where(level: value).pluck(:id)
    @test_passage.badges << badge if @user.passed_tests?(test_ids)
  end
end
