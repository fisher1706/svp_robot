ATTR_FONT_SIZE = 'font-size'
ATTR_COLOR = 'color'
ATTR_COLOR_ROW = 'background-color'

FRONT_SIZE_STANDARD = '12px'
FRONT_SIZE_HEADER_STANDARD = '14px'
COLOR_STANDARD = 'rgb(50, 53, 55)'

ROWS_COUNT = (10, 20, 50)

LABELS_LEGISLATOR = (
    'ID',
    'English Name',
    'Arabic Name',
    'Country',
    'Status',
    'Actions'
)

LABELS_LABORS_RESULTS = (
    'ID',
    'Name',
    'Passport Number',
    'Email',
    'Phone Number',
    'Exam Score',
    'Test Centers',
    'Owner name',
    'Exam date',
    'Result Status',
    'Certificate',
    'Actions'
)

LABELS_LABORS = (
    'National ID',
    'Full Name',
    'Passport Number',
    'Country of residence',
    'Nationality',
    'Phone Number',
    'Email',
    'Last Active Date',
    'Status'
)

LABELS_LABOR_ATTACHES = (
    'ID',
    'Email',
    'Creation date',
    'Last active date',
    'Actions'
)

LABELS_TCENTERS = (
    'ID',
    'Name',
    'Country',
    'City',
    'Status',
    'Actions'
)

LABELS_EXAM_SESSIONS = (
    'Session ID',
    'Session date',
    'Start/End time',
    'TC local time',
    'Time zone',
    'Test center',
    'Category',
    'Country',
    'City',
    'Seats',
    'Test takers count',
    'Status',
    'Actions'
)

LABELS_SVPL_RESERVATIONS = (
    'ID',
    'Test Taker',
    'Passport Number',
    'Country',
    'Nationality',
    'City',
    'Test Center',
    'Category',
    'Session ID',
    'Verification Code',
    'Reservation date',
    'Reservations status',
    'Score',
    'Actions'
)

LABELS_SVPI_RESERVATIONS = (
    'ID',
    'Test Taker',
    'Passport Number',
    'TC local time',
    'Time zone',
    'Country',
    'Nationality',
    'City',
    'Test Center',
    'Category',
    'Session ID',
    'Verification Code',
    'Reservation date',
    'Reservations status',
    'Exam result',
    'Score',
    'Actions'
)

LABELS_REQUESTS = (
    'ID',
    'Request date',
    'Test Center Name',
    'Test Center status',
    'Request status',
    'Actions'
)

LABELS_OCCUPATIONS = (
    'ID',
    'Key',
    'Arabic Name',
    'Category Code',
    'Category English Name',
    'Category Arabic Name',
    'Name',
    'Actions'
)

LABELS_CATEGORIES = (
    'ID',
    'Code',
    'English Name',
    'Arabic Name',
    'Publish',
    'No. Occupations',
    'Actions'
)

LABELS_COUNTRY_SETTINGS = (
    'ID',
    'Country',
    'Legislator',
    'Test Center',
    'Actions'
)

LABELS_ACTION_LOGS = (
    'Entity ID',
    'Entity name',
    'Name',
    'Updated At',
    'Actions'
)

LABELS_FAQ = (
    'ID',
    'Section name (English)',
    'Section name (Arabic)',
    'Number of questions',
    'Actions'
)

LABELS_TRANSACTIONS = (
    'ID',
    'Status',
    'Transaction date'
    'Actions'
)

LABELS_CERTIFICATE_BALANCE = (
    'ID',
    'Owner Name',
    'Owner Role',
    'Country',
    'Paid amount',
    'Total Balance',
    'Total Remaining Balance',
    'Trial Remaining Balance',
    'Issued Certificates',
    'Total Remaining'
)

LABELS_CSV_HISTORY = (
    'Legislator',
    'Test Center',
    'Category',
    'Country',
    'Action By',
    'Download File',
    'Actions'
)

LABELS_INVOICE_HISTORY = (
    'Reference Number',
    'Amount',
    'Owner Name',
    'Country',
    'Transaction date',
    'Reservation ID',
    'Reservation type',
    'Status',
    'Actions'
)

LABELS_ADMIN_USERS = (
    'ID',
    'Email',
    'Role',
    'Country',
    'Creation Date',
    'Last Active Date',
    'Status',
    'Actions'
)

LABELS_ASSESSORS = (
    'Full Name',
    'CNIC',
    'Phone Number',
    'Passport Number',
    'City',
    'Category',
    'Applied On',
    'Status',
    'Registration method',
    'Actions'
)

URL_LEGISLATORS = 'legislators'
URL_LABORS = 'labors'
URL_REGISTERED_LABORS = 'registered-labors'
URL_LABOR_ATTACHES = 'labor-attaches'
URL_ADMINS = 'admins'
URL_ASSESSORS = 'assessors'
URL_CENTERS = 'centers'
URL_EXAM_SESSIONS = 'exam-sessions'
URL_RESERVATIONS_SVPL = 'reservations-svpl'
URL_RESERVATIONS = 'reservations'
URL_REQUESTS = 'requests'
URL_OCCUPATIONS = 'occupations'
URL_CATEGORIES = 'categories'
URL_COUNTRY_SETTINGS = 'country-settings'
URL_LOGS = 'logs'
URL_FAQS = 'faqs'
URL_TRANSACTIONS = 'transactions'
URL_CERTIFICATE_BALANCE = 'certificate-balance'
URL_CSV_HISTORY = 'csv-history'
URL_INVOICE_HISTORY = 'invoice-history'

SPACE_DATASET = {
    URL_LEGISLATORS: LABELS_LEGISLATOR,
    URL_LABORS: LABELS_LABORS_RESULTS,
    URL_REGISTERED_LABORS: LABELS_LABORS,
    URL_LABOR_ATTACHES: LABELS_LABOR_ATTACHES,
    URL_ADMINS: LABELS_ADMIN_USERS,
    URL_ASSESSORS: LABELS_ASSESSORS,
    URL_CENTERS: LABELS_TCENTERS,
    URL_EXAM_SESSIONS: LABELS_EXAM_SESSIONS,
    URL_RESERVATIONS_SVPL: LABELS_SVPL_RESERVATIONS,
    URL_RESERVATIONS: LABELS_SVPI_RESERVATIONS,
    URL_REQUESTS: LABELS_REQUESTS,
    URL_OCCUPATIONS: LABELS_OCCUPATIONS,
    URL_CATEGORIES: LABELS_CATEGORIES,
    URL_COUNTRY_SETTINGS: LABELS_COUNTRY_SETTINGS,
    URL_LOGS: LABELS_ACTION_LOGS,
    URL_FAQS: LABELS_FAQ,
    URL_TRANSACTIONS: LABELS_TRANSACTIONS,
    URL_CERTIFICATE_BALANCE: LABELS_CERTIFICATE_BALANCE,
    URL_CSV_HISTORY: LABELS_CSV_HISTORY,
    URL_INVOICE_HISTORY: LABELS_INVOICE_HISTORY
}
