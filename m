Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA01A83FE
	for <workflows@vger.kernel.org>; Fri, 20 Dec 2024 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685798; cv=none; b=jC0lHedanhqWdhbWzk0h1pyNDRbhQudmUJPAXlDjY3Lk1UF/mWSG9QjM0MhfLBK+HL9Goo6ZL3ZUxsEqDD0NZhFpGjZqSN05c0UxIPuAIBcCNederTVcgPET8KoDmkOhhos8xJ6hbPm5NQFUq0VBgJlGhwGT96zCbZP5Vh/ySMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685798; c=relaxed/simple;
	bh=Pf1/Y95QfoHBWFZt23A81iwIFZjskYZP7erWkvJfJAw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XeXoestzAsnIA7Wn+Hoym+yWwPJwvFQP5s05s1sLgiCE7VeypraTimkYK+1OYI0WSXEpJQPtVsJfADcx4UGyVxELctYicC+wUWwBmcGqnWvPMniE4sQTWUSUcWtNnSLRAJRHZ+WK5WInICd9nbLI+eNAcK3/Bestby4HYKe0QkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ10-0001DY-CR; Fri, 20 Dec 2024 10:09:46 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ0z-004LrA-0l;
	Fri, 20 Dec 2024 10:09:46 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZ0z-00HILv-31;
	Fri, 20 Dec 2024 10:09:45 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RFC 0/2] docs: process: submitting-patches: clarify
 imperative mood suggestion
Date: Fri, 20 Dec 2024 10:09:33 +0100
Message-Id: <20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE00ZWcC/x3MsQrCMBAG4FcpN3vgxYDVVfABuopD2p7tPzSGX
 CxC6bsbHL/l28g0Q42uzUZZVxjesUIODQ1ziJMyxmpyR+fFyYXt0y8oBXHiFMowqzGWpDkUrMr
 Ot15O51bGXqgeKesL3///oO5+o+e+/wDAa62mdAAAAA==
X-Change-ID: 20241219-submitting-patches-imperative-248413781db1
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, 
 Rob Herring <robh@kernel.org>, Frank Li <Frank.li@nxp.com>, 
 kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: workflows@vger.kernel.org

Many commit message bodies start off with some background information,
before explaining how they address the situation. This can be arguably
easier to follow than having the imperative in the commit message title
be followed directly by another differently worded or more verbose
imperative in the commit message body and then at the end an
", because ..." with an explanation why things were done this way.

Yet, while the documentation talks about use of imperative mood, it does
not fully explain why, which IMO makes it prone to misunderstanding[1][2].

Therefore adapt the documentation to clarify the intent of the imperative
mood and give an example for how a good commit message can look like.

[1]: https://lore.kernel.org/all/f085aa33-f0b7-49e7-bbfc-d3728d3e3e8c@pengutronix.de/#t
[2]: https://lore.kernel.org/all/Z2RzA5S%2Fch1YDdUD@lizhi-Precision-Tower-5810/

---
Ahmad Fatoum (2):
      docs: process: submitting-patches: split canonical patch format section
      docs: process: submitting-patches: clarify imperative mood suggestion

 Documentation/process/submitting-patches.rst | 74 +++++++++++++++++++---------
 1 file changed, 52 insertions(+), 22 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241219-submitting-patches-imperative-248413781db1

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

