CLASS_SCORES = {
  "Harry Potter" => {
    "Alchemy" => nil,
    "Arithmancy" => nil,
    "Astronomy" => 6,
    "Care of Magical Creatures" => 8,
    "Charms" => 5,
    "Defence Against the Dark Arts" => 10,
    "Divination" => 4,
    "Herbology" => 7,
    "Muggle Studies" => nil,
    "Potions" => 2,
    "Study of Ancient Runes" => nil,
    "Transfiguration" => 7,
  },
  "Hermione Granger" => {
    "Alchemy" => 9,
    "Arithmancy" => 10,
    "Astronomy" => 9,
    "Care of Magical Creatures" => 9,
    "Charms" => 10,
    "Defence Against the Dark Arts" => 9,
    "Divination" => 1,
    "Herbology" => 10,
    "Muggle Studies" => 10,
    "Potions" => 3,
    "Study of Ancient Runes" => 9,
    "Transfiguration" => 10,
  },
  "Ron Weasley" => {
    "Alchemy" => nil,
    "Arithmancy" => nil,
    "Astronomy" => 6,
    "Care of Magical Creatures" => 7,
    "Charms" => 7,
    "Defence Against the Dark Arts" => 8,
    "Divination" => 7,
    "Herbology" => 8,
    "Muggle Studies" => nil,
    "Potions" => 3,
    "Study of Ancient Runes" => nil,
    "Transfiguration" => 7,
  },
  "Neville Longbottom" => {
    "Alchemy" => 4,
    "Arithmancy" => nil,
    "Astronomy" => nil,
    "Care of Magical Creatures" => 5,
    "Charms" => 4,
    "Defence Against the Dark Arts" => 4,
    "Divination" => 5,
    "Herbology" => 10,
    "Muggle Studies" => nil,
    "Potions" => 1,
    "Study of Ancient Runes" => nil,
    "Transfiguration" => 6,
  },
  "Draco Malfoy" => {
    "Alchemy" => nil,
    "Arithmancy" => 7,
    "Astronomy" => nil,
    "Care of Magical Creatures" => 4,
    "Charms" => 7,
    "Defence Against the Dark Arts" => 3,
    "Divination" => nil,
    "Herbology" => 8,
    "Muggle Studies" => nil,
    "Potions" => 10,
    "Study of Ancient Runes" => 7,
    "Transfiguration" => 7,
  },
  "Vincent Crabbe" => {
    "Alchemy" => 1,
    "Arithmancy" => 2,
    "Astronomy" => nil,
    "Care of Magical Creatures" => 2,
    "Charms" => nil,
    "Defence Against the Dark Arts" => 1,
    "Divination" => nil,
    "Herbology" => 3,
    "Muggle Studies" => nil,
    "Potions" => 9,
    "Study of Ancient Runes" => 3,
    "Transfiguration" => 2,
  },
  "Greggory Goyle" => {
    "Alchemy" => 2,
    "Arithmancy" => 2,
    "Astronomy" => nil,
    "Care of Magical Creatures" => 3,
    "Charms" => nil,
    "Defence Against the Dark Arts" => 2,
    "Divination" => nil,
    "Herbology" => 2,
    "Muggle Studies" => nil,
    "Potions" => 8,
    "Study of Ancient Runes" => nil,
    "Transfiguration" => 3,
  },
  "Ginny Weasley" => {
    "Alchemy" => 8,
    "Arithmancy" => nil,
    "Astronomy" => nil,
    "Care of Magical Creatures" => 8,
    "Charms" => 9,
    "Defence Against the Dark Arts" => 9,
    "Divination" => nil,
    "Herbology" => 9,
    "Muggle Studies" => 9,
    "Potions" => 3,
    "Study of Ancient Runes" => nil,
    "Transfiguration" => 8,
  },
  "Cho Chang" => {
    "Alchemy" => nil,
    "Arithmancy" => 8,
    "Astronomy" => 9,
    "Care of Magical Creatures" => nil,
    "Charms" => 7,
    "Defence Against the Dark Arts" => 7,
    "Divination" => nil,
    "Herbology" => 8,
    "Muggle Studies" => nil,
    "Potions" => 6,
    "Study of Ancient Runes" => 9,
    "Transfiguration" => 9,
  },
  "Cedric Diggory" => {
    "Alchemy" => 6,
    "Arithmancy" => nil,
    "Astronomy" => 8,
    "Care of Magical Creatures" => 8,
    "Charms" => 7,
    "Defence Against the Dark Arts" => 6,
    "Divination" => nil,
    "Herbology" => 6,
    "Muggle Studies" => nil,
    "Potions" => 3,
    "Study of Ancient Runes" => nil,
    "Transfiguration" => 3,
  }
}

def scores_keyed_on_class
  CLASS_SCORES.to_a.inject({}) do |memo, item|
    student_name, scores = item
    scores.each do |class_name, score|
      memo[class_name] ||= {}
      memo[class_name][student_name] = score
    end
    memo
  end
end

def scores_as_html(invert = false)
  scores = CLASS_SCORES
  scores = scores_keyed_on_class if invert
  table = "<table>\n"
  table << "  <thead>\n"
  table << "    <tr>\n"
  table << "      <th></th>\n" # First column is empty in the head
  table << scores.first[1].keys.map do |student_name|
    "      <th>#{student_name}</th>"
  end.join("\n")
  table << "\n"
  table << "    </tr>\n"
  table << "  </thead>\n"
  table << "  <tbody>\n"
  table << scores.map do |name, scores|
    <<-EOR
      <tr>
        <td>#{name}</td>
        #{ scores.map{ |_, value| "<td>#{value || "-"}</td>" }.join("") }
      </tr>
    EOR
  end.join("\n")
  table << "  </tbody>\n"
  table << "</table>\n"
end
