Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2861EB9FA;
	Tue, 13 Jan 2026 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768274578; cv=none; b=sdM2J5+LaOUaSp2nDfJO6NMY75M6JpAc6Pc7oVL+56JW6028B47lWP9MKJ8ga4JOu+UdkyJl0WJWY67721h/YQMNXRK9RVzdpcyPkpqwTKliirfK6VCm9RFaCc8GNMY+C5HN7tbqrwughL8120tKbknA46wZnTsaBIMBI3/w4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768274578; c=relaxed/simple;
	bh=qBpGhliMx0mgkoSIcLVrnkmna3UupRTRq4CYtRgHij4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LLH5Sm+vez6lgzudDdKmC1V32USxmr9lv/DU7NkTzceaEO97ldL9T7n1N3lhI7u67oa/pNQ+oDeExqIvCpkjomKpNyKOPeRI8pHbaV9emBHgZZGm84Idt8ryMbaTReb2QzikvUGclCMMNsDrYGBTE4kEsYBnAm70jRtNOVJBFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZmzN8am; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZmzN8am"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6324CC116D0;
	Tue, 13 Jan 2026 03:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768274578;
	bh=qBpGhliMx0mgkoSIcLVrnkmna3UupRTRq4CYtRgHij4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=uZmzN8am7TsNtjl1J8Tbisho/1vcJZo0S6VCCtTl6DjCIPsn2NZOYTQBUxc2JHgWg
	 t990mLwwkR8k5nzcBM+oUW7sFOBiRvQiAYtu1k6qZ6yFTylSm1vH3gkYjjD2Oct6Nj
	 WlVr4+e1oo6P2ORGSxAFUkQr49oMOIa70Ij4eHt0JD2dagek0Ue+XKD4BsG33ozVkQ
	 LeE96XU+ezVv+9k9w52uaDx56Ca3SwiQY1evybkPFfx5Xzo9ubhxY0K1Y15JXSdjoW
	 qGEN61Nwx15Tz30zmDOT8S5oHiEB/awMLRwOaxI269xqNG7z9ofidele9DK0+IYoLX
	 YLNUCNTHwZ1qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D96ED29DC7;
	Tue, 13 Jan 2026 03:22:58 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+cryolitia.uniontech.com@kernel.org>
Date: Tue, 13 Jan 2026 11:22:52 +0800
Subject: [PATCH RESEND v2] checkpatch: Suppress warnings when Reported-by:
 is followed by Link:
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-checkpatch-v2-1-5dfe8b9f4d90@uniontech.com>
X-B4-Tracking: v=1; b=H4sIAIu6ZWkC/3WOPQ+CMBiE/4rpbE0/sKVODrI66GgYSvvWNkYgg
 ERD+O8WRpHx7vLc3YBaaAK06LAZUAN9aENVRsG2G2S8Lu+Ag40aMcL2RFGFjQfzqHVnPCZMCpl
 KKFwBKAJ1Ay6857IbumTX7HxCefR9aLuq+cwbPZ3Tf3U9xRTbNFVKcsWZ08dXGd90YPzOVM9pY
 cIoIUus0I6AoEmhxCrG+AJzTnKwMZJWrGCUkuVJqUHZRGguf7F8HMcvDt71blUBAAA=
X-Change-ID: 20250919-checkpatch-0276787ebfbe
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, ltp@lists.linux.it, 
 niecheng1@uniontech.com, zhanjun@uniontech.com, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768274577; l=1809;
 i=cryolitia@uniontech.com; s=20250730; h=from:subject:message-id;
 bh=VE6TM5bOD2xrus3PUyCCcDFeowc5jbcfaHJXtjNJP6E=;
 b=H/KmEQriZzSu52B7ZrKMnqG2miNglsyHC9jPS9DFPtDDyHeRknjMSTjUw8oeg5JAuFoPIVG8m
 kMABb8g9rLOCjvhDqFxcPKtvNRnyqmmB3yJsoNFtH9tMhlOJovsCtNo
X-Developer-Key: i=cryolitia@uniontech.com; a=ed25519;
 pk=tZ+U+kQkT45GRGewbMSB4VPmvpD+KkHC/Wv3rMOn/PU=
X-Endpoint-Received: by B4 Relay for cryolitia@uniontech.com/20250730 with
 auth_id=474
X-Original-From: Cryolitia PukNgae <cryolitia@uniontech.com>
Reply-To: cryolitia@uniontech.com

From: Cryolitia PukNgae <cryolitia@uniontech.com>

> The tag should be followed by a Closes: tag pointing to the report,
> unless the report is not available on the web. The Link: tag can be
> used instead of Closes: if the patch fixes a part of the issue(s)
> being reported.

Accroding to Documentation/process/submitting-patches.rst , Link: is
also acceptable to followed a Reported-by:

Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
Link to previous: https://lore.kernel.org/r/20251023-checkpatch-v1-1-ff73ed1027d6@uniontech.com
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c0250244cf7a..dac9d98133c6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3209,10 +3209,10 @@ sub process {
 			if ($sign_off =~ /^reported(?:|-and-tested)-by:$/i) {
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . "\n");
-				} elsif ($rawlines[$linenr] !~ /^closes:\s*/i) {
+					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . "\n");
+				} elsif ($rawlines[$linenr] !~ /^(closes|link):\s*/i) {
 					WARN("BAD_REPORTED_BY_LINK",
-					     "Reported-by: should be immediately followed by Closes: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
+					     "Reported-by: should be immediately followed by Closes: or Link: with a URL to the report\n" . $herecurr . $rawlines[$linenr] . "\n");
 				}
 			}
 		}

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20250919-checkpatch-0276787ebfbe

Best regards,
-- 
Cryolitia PukNgae <cryolitia@uniontech.com>


