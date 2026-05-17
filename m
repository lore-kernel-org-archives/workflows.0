Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5050F3B7770;
	Sun, 17 May 2026 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.110.109.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779033082; cv=none; b=d6e8YQkeDUnrqawuhAsn96kNgijeYJR3HsR9rZK9TJdvT7ChypVYGbOuQGkFVGGQm8B24I1wmlsVo3th8ncgzb3Jy/0DqC/ecYvo2kXBurYK5EeLs4Pf2ege9nQYE3mafSW5yd65VeyoXJD2+Ysi1c9NSMfgvlvYXZuokHT5Sjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779033082; c=relaxed/simple;
	bh=PcgrPFzDl99t+SthxMlQrcpaADWjEm49nKN2R/4x8Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uw98YBSKKXdoNGkbkDBtvuPwnJoH36+QQ69HZzhQsJOXhxkQhv1+c2ae7KjvTx95bCT3ixZXdYVV4JWtFdU1qGomCxrN47l6KCVe5ESvngUgH16LmOI9gaFAaGEMmsWx5gM1+PI5xfbxHHszz3rh4T1O814MBwS7lJ1FoIpluQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il; spf=pass smtp.mailfrom=tkos.co.il; dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b=D7bfIvUi; arc=none smtp.client-ip=84.110.109.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tkos.co.il
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il header.b="D7bfIvUi"
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 6AAFE4403AE;
	Sun, 17 May 2026 18:41:21 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1779032481;
	bh=PcgrPFzDl99t+SthxMlQrcpaADWjEm49nKN2R/4x8Xw=;
	h=From:To:Cc:Subject:Date:From;
	b=D7bfIvUi8ebimLlcq+XtQbR3enuPYT+eUaHRlbFnXY/VJZxQkcIbziNBQmQOawkHF
	 G/fO2u5gVP0Uwbhzx61HWvKSgUKInAFokUYAaELKfVtqutUKIAmA9P6xMq9zw6qBJw
	 lE3lH3Wj2/GFDucbILojJUFDNdKMJwYyZy/vSrbQOoPvU5njoXNb6OWxvx99pG2A7B
	 xxlTQHSVY5qPKwMqYo2AMeDdbAV0gwvP08zkjDUWSuX+OPbpQOswoiA6NxJnmUgSm4
	 JWekSiT9hZ4AEHFXtGmnlOks7rnlvDKvZyRCpBMflKmykiHJoiSgrkpbBuefDWaAb0
	 Y7YABi3wt9vHA==
From: Baruch Siach <baruch@tkos.co.il>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Willy Tarreau <w@1wt.eu>,
	Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] docs: threat-model: add missing closing parenthesis
Date: Sun, 17 May 2026 18:41:41 +0300
Message-ID: <da8ee1e8b4e99261ec11544c4e1a4f81316ae965.1779032501.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/process/threat-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
index f177b8d3c1ca..9dd8011dde82 100644
--- a/Documentation/process/threat-model.rst
+++ b/Documentation/process/threat-model.rst
@@ -176,7 +176,7 @@ regular bug:
   * problems seen only under development simulators, emulators, or combinations
     that do not exist on real systems at the time of reporting (issues
     involving tens of millions of threads, tens of thousands of CPUs,
-    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds.
+    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds).
 
   * issues whose reproduction requires hardware modification or emulation,
     including fake USB devices that pretend to be another one.
-- 
2.53.0

