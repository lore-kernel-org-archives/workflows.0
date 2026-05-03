Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B072317142;
	Sun,  3 May 2026 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777808138; cv=none; b=SXzY9CjQrtM6YHySbcVn0QzGfYTuItzsYS81Guomwh9BRZC47c7FPA7TEBFLzVlDo9HquDGgIT/cn8ty39aoVQ20HVS1E+D8VcoC2v+4DqH+doloOchwpeNgQWWJyejrcSB1Ge+Hx/XS7ZwYGY8u0mwE8ZtCfTvZQJwH85EERkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777808138; c=relaxed/simple;
	bh=YwcNdtJ5dZGo3c0u2URHnkbVwr2tYfsy9Y/UmIt/bzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQz5UFD7Cxzwm5Fd49pkDD++tBwBnOC87uOjJKfRM44Sbfl1fuiCWdThZZMhM7ycTIOWrDj2+HHkFpxwlOiKS5UEFXcyVSvZ1s+JbPjP2k6xJsEqcfIG5zAQZrYaaGZ++9PSb4YSh3VBcuouamY/9z3DskX7j/Uw63muZFy97es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Vb36txbh; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Vb36txbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777808135; bh=3YQeG63cxUBIcGGm2uCmzofjGBM+wDHMp4UdcZEVSr4=;
	h=From:Message-ID:From;
	b=Vb36txbhW2FR8uAIrlHc7ii2eRjRTLJQuoryGi7sCnKMZI4MWt0J/6tJr3OzdmZjy
	 7YGXgjk4iD4rWy29VCaUvYPCMqEXk3PG3q+2G3QyYKxRnlPIMnKvjKw79XSSejZ00Y
	 tzGVIlHq5E30c55HPZKGoeifQFOv9Ls/j5qSb/B8=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 16B03C0A41;
	Sun, 03 May 2026 13:35:35 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>
Subject: [PATCH v2 0/3] Documentation: security-bugs: new updates covering triage and AI
Date: Sun,  3 May 2026 13:35:03 +0200
Message-ID: <20260503113506.5710-1-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series tries to translate recent discussions on the security list
on how to better handle reports. It details:
  - when not to Cc: the security list
  - what classes of bugs do not need to be handled privately
  - minimum requirements for AI-assisted reports

As usual, this is probably perfectible but can already help in the short
term as we can point it to reporters, so barring any strong disagreement,
better continue to proceed in small incremental improvements and observe
the effects.

Thanks!
Willy

---
v2:
  - fixes for issues reported by Randy
  - Greg's ack on the AI part
  - reworded the "when to Cc" part based on Greg's feedback
    (Greg I didn't take your original ack since the wording changed)
  - split the threat model into its own document as per Greg's suggestion

---
Willy Tarreau (3):
  Documentation: security-bugs: do not systematically Cc the security
    team
  Documentation: security-bugs: explain what is and is not a security
    bug
  Documentation: security-bugs: clarify requirements for AI-assisted
    reports

 Documentation/process/index.rst         |   1 +
 Documentation/process/security-bugs.rst |  93 +++++++++-
 Documentation/process/threat-model.rst  | 231 ++++++++++++++++++++++++
 3 files changed, 324 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/process/threat-model.rst

-- 
2.52.0

