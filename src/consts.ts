export const SITE_TITLE = 'Sanpou';
// Descriptive <title> for the homepage. The bare brand name "Sanpou" is
// ambiguous (it reads as the Japanese phrase 三方よし to crawlers/LLMs), so the
// homepage title carries category words to make the product unmistakable.
export const SITE_TITLE_HOME = 'Sanpou — Walking Journal & Voice Memo App for iOS';
export const SITE_DESCRIPTION = 'A walking companion app that turns your daily strolls into a personal journal — voice memos, step tracking, and map visualization, all in one place.';
export const APP_STORE_ID = '6749672561';
export const APP_STORE_URL = `https://apps.apple.com/us/app/sanpou/id${APP_STORE_ID}`;

const APP_STORE_PROVIDER_TOKEN = '127752455';

export function buildAppStoreUrl(ct: string): string {
	return `${APP_STORE_URL}?pt=${APP_STORE_PROVIDER_TOKEN}&ct=${encodeURIComponent(ct)}&mt=8`;
}
