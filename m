Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7D445A2A0;
	Tue,  4 Aug 2026 16:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860040; cv=none; b=bURin3+2r+J8Hpxj5nxEYzPPOvN7p9N7lRQt9Ipl3MKLCsUBH3oRh3F2eXatnpSBznnIOvUMbwxrr8X1C2y04PhfrVLbWxWig/ejyVcjnuKDgVqeIhF/9pcUjizK4UXm8GzWxtD6DNywdhXZPy+Tv5vc6uqgEN3wgvx3DdbIXdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860040; c=relaxed/simple;
	bh=hhzgOBTCcw+7WG5YvDnKtyBFtbtsSZHLyB4TgJ8XZgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fvKR7oupNltG3oW4qNfB9JuM7yThk2OHwm4xlSLuj3GvOt2zjvo1jpku3x6k9cBhqu2iZ3uRZX1UNEI/a4hA857g8gd130XF0cFi6YEOmZ25wzEIE5R5A/MhPTiK45VtW+lyyKGxVX7lCrE+UU4Y+wQ+tcHFf0o1gWPCSHc4c9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEjXQwxT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEjXQwxT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73F81F000E9;
	Tue,  4 Aug 2026 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860039;
	bh=bbKY2cgVfrjmhlN9vCRzkvOgiOAO+ba86zGhGAsfpgw=;
	h=From:Date:Subject:To:Cc;
	b=UEjXQwxT5vknIgN2AbvFWPHGFWi+LN/n+WP35D75PRjx1aOEJlLpj/XHEbiXPMroN
	 Ef5jwH9P7gLFcPdoMZtb6FvMg3VAUmLzDnj2LQKD94M1jf1ylPZa+/K+Pf39KXd1GQ
	 JpDDpVfzXaXqHUPVhrKUOaUdsEkoNWUDCnK5K1IazaTa83NMacFKIqsCTBFt+4WJKN
	 /NFYdxcjdyUySiumzKIaENtE+6TTL4wocycLNBDEdS+FZMiQ6Ohc2AQ06LkW8T3GQq
	 D4uDRO4I/eiO1hyXQXqdaUCWzzr4+IbcItgLd7OTCUh73qjOAqSzRjArd+5gUyGrCm
	 xPxNSaLvWmsVA==
From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 04 Aug 2026 12:13:44 -0400
Subject: [PATCH] checkpatch.pl: adapt to new Assisted-by: format
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-checkpatch-v1-1-27f29c79a46f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMT3eSM1OTsgsSS5AxdC3MTA6MUMxNLA0tTJaCGgqLUtMwKsGHRsbW
 1AKpakmRcAAAA
X-Change-ID: 20260804-checkpatch-87402d649095
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 workflows@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=hhzgOBTCcw+7WG5YvDnKtyBFtbtsSZHLyB4TgJ8XZgA=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBqcg/B4Wtnz4rVVcI34mE57gK9312RW07wCrKqL
 2g7kUpOllWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCanIPwQAKCRAADmhBGVaC
 FXyuD/98HZz/eWjXAQx/FKiwQphQ2p9Y4cQOAg00Ak5i8ksp7XmXOzAkSZ55NtsC+oqc8KCYpaB
 ec/x2eQPv2clc3BR8YRRItXQGPIDIqOjkCZOQ49WUJtNXTWfFj+YZnlirncvWRt7H3zu4X7fN8e
 yDWk5HL1pn3zwHz8NzrPi8UvVMZBMd44CJmWWeJVdqpBLgcC41t+ftqg2waXDAJ97LSsh1Di1Hr
 ENBzRhwqyvZxnzFbw/x84Kvvu4saPTPYT0KcbO8I9XZCjN/7sd/TgY9nQUiYyLwdVjzbLCeCPoU
 h2EWhZSICe0Pxkk+4b3/OspD7DhdbbiLhDZBBX+veOIjrCUfDti2ZK/Q4J7rDQ0uu+EwgjRTAbR
 xCqD+Z/msXvpYMXXyn4F5ZKvX46oSEKtOPtpV1g0VvG5ZgqiJlJbe/uGxdyYI48xT+l4sbXOBI3
 eyb2Lw3PvAtJ6Z/UdVemJLDzrZ7H5WL8hyuO1H7FspUn//ugK3Jf/75xQa7HH5TvLtKODMhh/ZJ
 2ha2sIz3niGTqdCsqacHsy3/AVrV8DUzFlVsxeZyiUP21N0d+5J06H766GP6Ip6wqvtTnDdxqGs
 k+Hp/XOjEOIHHdpRyBCqfHXhA+rndMQ6pYGw0fiQuZd9SSUxNYlKweJwj04NtCIrQkuIyYAevGt
 fQViwyerceLujOg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

There is a new format for the 'Assisted-by:' tag. Change checkpatch.pl
to just check that it has a value rather than testing for a specific
format.

Assisted-by: LLM
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
This is a companion patch to the one to change the format in
Documentation/. See:

    https://lore.kernel.org/workflows/87qzkuahlr.fsf@trenco.lwn.net/
---
 scripts/checkpatch.pl | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2b7a42bbdd94..7961d9584bc5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3124,11 +3124,12 @@ sub process {
 				}
 			}
 
-			# Assisted-by uses AGENT_NAME:MODEL_VERSION format, not email
+			# Assisted-by uses a free-form value (e.g. "LLM"), not an
+			# email address, so skip the email format checks below.
 			if ($sign_off =~ /^Assisted-by:/i) {
-				if ($email !~ /^\S+:\S+/) {
+				if ($email =~ /^\s*$/) {
 					WARN("BAD_SIGN_OFF",
-					     "Assisted-by expects 'AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]' format\n" . $herecurr);
+					     "Assisted-by requires a value\n" . $herecurr);
 				}
 				next;
 			}

---
base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
change-id: 20260804-checkpatch-87402d649095

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

