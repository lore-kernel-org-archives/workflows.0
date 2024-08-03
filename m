Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2171.outbound.protection.outlook.com [40.92.63.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282924C7B;
	Sat,  3 Aug 2024 17:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.63.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722705569; cv=fail; b=OfEQDHQAB06s8jhE1Rt4QzK79qtzCfhJa6oWq7xebZbAUnl3oxaeArnJ4dRyAWcqxBs10Pb+560N/RYDeW9OJoLJF9dP5Zt+lkg6OsGYR+5vx5os4X7asCpMW4+jGZ7e61OAiGRfJTAnPo8Q+sEP7yoO+PtW99aYv79ByJdf1E4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722705569; c=relaxed/simple;
	bh=+WkjkgvXqtJXTlYjDw2Q9MuA+OGq70qJ7H0/6L7VqWE=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GS+8BCEyLzg/9H2lgX5fGIBXGVYl1psLTOnxFtzEfqSSMWQf3If7cNIeIcK2QxjjXdpru1+uvAQklDj7c2iIMY+Ua1jO9mJn5zJyh9a7CzBCPh79Y+oegYUZBKcQosFPJuaQUHAH/6lu4ZmNMJK+uXnl+7c9CTeODYtP4KDzTbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=t6uZaBQ+; arc=fail smtp.client-ip=40.92.63.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="t6uZaBQ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqRAJSbW3JwixDLOEe+iSqWPfDYfqqzcZD24K06AKg3C+OZFZHT0Cj8tX4QDCPFbOXCVMWWSKBf4DFxO6JHfx7OdytL/GOa1LUbJ7lSy3kWPPos1ydH82GsqD/yWAYw9tV+vJghKeBBvQ5PdUeelg5DxwQs8bwg64uQgdk5txHAQIuCAMu/t3PwrUYCROvnQCtlm4Er+qDe1mcoq7KNCN+pxFCbjqma9E80oJ1o4mfwGm4F7FHKcBpZw0JHKEOMeMmjBsdY6e5dFDAFBsErKFM3WNQXrTa+3CP4vsioKsTsSqdf8cjqCcpUdSSuukskG1seSf08+F8q+wMfo5Of4OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOPox8rCHM8OyH/z5AyMt0HntWkOSWoKbFiyrylSZ1o=;
 b=AzZvObh4KhkM68tj1HjvowkzkpBvGkiDMS09Q/qj23zHxcki2yJtEzgQSVosE31lKyiznvSucxCkip8rqpDvefvdpPepj4uoeY6EunN3FXHnurjhSpg2HVAB9uZ84Oi/ZAr5AQIW+EfnB+xHet6gthNZ4SbHansHE8no8bG+y8NthNXxV06RXS/lNel9Lu6+KbjBGoAvdHUcyaYayuDJ0J4dCAieozSW7NDfWutcHUcn+bZI2g1Vr/igncKbqA5xtGq92vSe9gfp72MvBoHIRqGXIKyxXVSaAyKbUZtFnnpQE+79DrW+gZ7WPKGZGVALrDnnXihhkQTMDImSQIK78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOPox8rCHM8OyH/z5AyMt0HntWkOSWoKbFiyrylSZ1o=;
 b=t6uZaBQ+oddm+Ooha7MSoyd2K4H4nLni3d8u3IAs3AmhrAAA6Y4AJ6Zy+jgBccD5Pdto/MUU9dN8EZd1jkuPEkEZxoZcreLDkjvtBNbRlvsDPrtcWHZKG36LNVgy59NQ8kZbpxkinTOEq0l88QNeiLCkgPUI1iXU9JMXb73PwTn0VPO1JQkBlWzg8U2kbSH8hXhtJ3+Wszf3dSwwXOpv1vnPIsiOo5OhXFs5UKKWAc7jIdbKEoHC+xSdKbnplBymyj1RN5nWOI8JvSXOvqf9JZCMkypp2PAk4+VRuhWCVOJ9AYbwzYayIbo/x4yrF5W6duaqlukEb36SP9QZjsZLaA==
Received: from SY0P300MB0801.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:27f::21)
 by ME0P300MB0656.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Sat, 3 Aug
 2024 17:19:15 +0000
Received: from SY0P300MB0801.AUSP300.PROD.OUTLOOK.COM
 ([fe80::dd81:ab35:a02c:23a2]) by SY0P300MB0801.AUSP300.PROD.OUTLOOK.COM
 ([fe80::dd81:ab35:a02c:23a2%3]) with mapi id 15.20.7828.024; Sat, 3 Aug 2024
 17:19:14 +0000
Date: Sun, 4 Aug 2024 02:19:09 +0900
From: Jiamu Sun <barroit@linux.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: improve comment consistency in .muttrc example
 configuration
Message-ID:
 <SY0P300MB0801D1A4B278157CA7C92DE2CEBC2@SY0P300MB0801.AUSP300.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TMN: [WQcxzbc0Ex5TXKJVqvDXdYJO8Fr5p572]
X-ClientProxiedBy: OSTPR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:604:221::7) To SY0P300MB0801.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:27f::21)
X-Microsoft-Original-Message-ID: <Zq5mjS3_H7S-4Jsk@SUPERFORTRESS>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Jiamu Sun <sunjiamu@outlook.com>
X-MS-Exchange-MessageSentRepresentingType: 2
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY0P300MB0801:EE_|ME0P300MB0656:EE_
X-MS-Office365-Filtering-Correlation-Id: 1936aa93-811b-4a27-506c-08dcb3e065f8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5072599009|8060799006|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	JaAhsQc/ZDVHYCd0h7Fcc85S7NUOINxciKpWPpUcJohgTZX/asJRFU9IuCutPNfN+bkr40Rn0D+PoDQDWNEZYN2fFhvXk+ICBJ2GCcbVs9TeWKUeVmlzNhuH7NpNcrnownw6wmGJTzSuRnMK81iDIIj4UZEqaTOOJq9GauaaD2ctRF4M7khAbfAt9BFDM6iskU4zZiJc9l4qSHC1c8+T/VOgiUOqNvUlStOIF2yRb8BVzA2Qwb4Za/+zFy3X3xmmmUnfMSHeWPfxEA4ILVJpXcIqq+/dx+JafZL+dh8VV5d6OnLiGN7NNpAVQt/z6CYMTVbreqSspNxgEw3j0yrsaGHM1ytYM1Lcrjow45elgfp3N7F9nLgpcgDFsbyV7UR8O0CRTcmzOplVmfDXtH9emeFB1Z1oKjWap83pI2vm19OXC6ATboyJmcobBAd1uDTdy7STpw0ISvPn8n4F12aIRNTgorxH8Zg9IttoM0aDqwfKSR/z+zCwmzYHpcuC9fyUHad/MatrTDzXTM2PR21qFEon3SeiFc3wvkvDS7IImvLr7vdQPFPZfF68/0QqBde7/2D3If11E1cZ+4PeVyH6+RpZO5wlGflmzUD0tHh9uqrOpiaGgmok5QAvste1IivXe9CZPJLJVo1njS+dumGyzMZK2NzmsR9MvFNlom2rkBE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o5geF2fmuGn5TglGSWMPwxMCiqqPSRtROG9rEXLXXXln3hzICwMD3o0xKi+8?=
 =?us-ascii?Q?Ww1z4hJUhP839BmP3Rbxo4vmoeNeGs+dXelx9+YF3DwlW7GPhbST6yLFUWH2?=
 =?us-ascii?Q?jqx1vxaDToMLf6dyMgdtxVdRfXzjUB+kDUfAn+iKIVtUrhTTYjOwaUJemOm7?=
 =?us-ascii?Q?YhvfMWdAmbnxGzVmpOuO3Th32xjjYFaCGRzuSBGYHrv0nKynDLf1xxo3lm+d?=
 =?us-ascii?Q?Rdo9Fc7z+FDrvGQkURuXcYcctPHr1HP5DV1v8YF6NidYXmKTp0IDtE2OqZDT?=
 =?us-ascii?Q?Xpn5ki2XYSkaNDUKXqJww4pcBTZsWvv9I7iU5dA+lCJuMpE6PcBw2dE2c449?=
 =?us-ascii?Q?x2JCnIzz1iLhGBihhuYVbEGeAcKxYHbJhMa7cDMd7fKtNOq7eEK+cYwYDKsS?=
 =?us-ascii?Q?FeCBScXa681BdpGSdiNLusphEpwVb6Brr0N23z5glMo69fCDxBOOpeZex55T?=
 =?us-ascii?Q?SE692LzeHeWhbalwJ9z+4md4ivpjcw5HToLdPisNya8Cxa36g63WK6C5XWqD?=
 =?us-ascii?Q?sqAcqDFtE9APJPkikeDkrJOaMg7vvLLy+tZaFLXG4b9eKJsK6A7zHXa9af+T?=
 =?us-ascii?Q?JNFZ0g5D1qsdVcik7W1zyPNvbHETkvJIw6wA+8tofLgS/pN6zJAeiwLPcU4e?=
 =?us-ascii?Q?jIlLLncqr03bTB474MRQCQn+rhjRF0pfs8zNiq4e7N3Hnx1IZJqv9abdTzfv?=
 =?us-ascii?Q?2Vc2GmzOqYeJ0xcKUqrM2qw042zSttd6gSKcgkzqCivGsn5uaipc3FrrV/7h?=
 =?us-ascii?Q?5WaMHvsKuyt4u0bS1PGVx1NlUPI4P/1SHxn9aJhmBTN6Ap/xvsjym5IPzce6?=
 =?us-ascii?Q?Qa210pt5XNw7U28QURBzqKJzy4B4gUWZMS+j7Mt51GGr0CdZWvU7AsSuVmT9?=
 =?us-ascii?Q?PfDPlIDUX+3cOq8Xq48Bne+lMGn/SM1PLRUydPTsU2wPU85HIW2l9XlxM11E?=
 =?us-ascii?Q?x12zLHDbV7XiAxOm1udz7yblZYz4zrJszfQ/djLrqTEynTGg1vyXkDJoRQXo?=
 =?us-ascii?Q?uxkmH7jHYdQjU+wHmiS9tp7VPTgPld3h9Q5nU2V6KEEyr5S17pQmbLbkvaMl?=
 =?us-ascii?Q?ic6/sBMNSlJwad2JYJbi7I3KTIoqNecnBFiOREVyCU0+3ovj6xIkcpdM8Rb1?=
 =?us-ascii?Q?c/LSaLTB5YzbqJBSqodFZOTLbU+84qKF/0t4IU3s0SqTEX3sI6HQBknFysy5?=
 =?us-ascii?Q?Wxsv1TNzLZcGV+qQCOdpNJbdqYK0fiKrgemk94qoaFUMoXUBB5BIf23Ah5A?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1936aa93-811b-4a27-506c-08dcb3e065f8
X-MS-Exchange-CrossTenant-AuthSource: SY0P300MB0801.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2024 17:19:14.5713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0656

Added a space to align comment formatting; this helps improve
consistency and visual uniformity.

Signed-off-by: Jiamu Sun <barroit@linux.com>
---
 Documentation/process/email-clients.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
index dd22c46d1d02..e6b9173a1845 100644
--- a/Documentation/process/email-clients.rst
+++ b/Documentation/process/email-clients.rst
@@ -216,7 +216,7 @@ Mutt is highly customizable. Here is a minimum configuration to start
 using Mutt to send patches through Gmail::
 
   # .muttrc
-  # ================  IMAP ====================
+  # ================  IMAP  ====================
   set imap_user = 'yourusername@gmail.com'
   set imap_pass = 'yourpassword'
   set spoolfile = imaps://imap.gmail.com/INBOX

base-commit: 8663dd38a7ba5b2bfd2c7b4271e6e63bc0ef1e42
-- 
Jiamu Sun <barroit@linux.com> <sunjiamu@outllok.com>

