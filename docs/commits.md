#### Правила написания коммита

##### Общие принципы
- всё в нижнем регистре;
- кратко и по‑английски (или по‑русски, но одинаково везде);
- в повелительном наклонении: `add`, `fix`, `update`.

##### Основные типы `<type>`
- `feat` — новая фича.
- `fix` — исправление бага.
- `chore` — инфраструктура, конфиги, линтеры, XcodeGen.
- `refactor` — рефакторинг без изменения поведения.
- `docs` — изменение документации.
- `test` — только тесты.
- `style` — форматирование, правки без логики.

##### Формат коммита если нет задачи в Task Tracker:
`<type>[: optional-scope]: <short summary>`

##### Примеры
- `feat(auth): add login screen`
- `fix(profile): handle empty avatar`
- `chore: add xcodegen and swiftlint`
- `docs: describe branching rules`
- `style(profile): extract constants for colors`

--- 
##### Формат коммита если есть задача в Task Tracker:
`<type>(<scope>): <TASK-KEY> <short summary>`

##### Примеры
- `feat(auth): IOS-123 add login screen`
- `fix(profile): IOS-456 handle empty avatar`
- `chore(ci): IOS-89 add github actions workflow`
- `docs: IOS-77 describe branching rules`
- `style(workout-list): IOS-92 extract typography constants`