Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4494224F3;
	Sun, 26 Apr 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777222065; cv=none; b=rPtGXg/qmthescXPqlU10t8pIKYXAqWjpCMNqMP1KhvoX+2lNwsfnBn3DEY3GVZtyOORXccotw20nOQWR36Y5HAIYB8uyhf7mV4Wxv0b1fp49oZ7mLUVjX+k//Z9lBEyn86Ik3iddeBKu0M+UniFKf4PfEdNsl9Y1nof2aWnR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777222065; c=relaxed/simple;
	bh=rfiUOfaDnFrgT2dEVu6vzqYh/07NWZgor2mLNXJDSCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AHPx/UGhbX+vjZGxfihi0du0S17ihjSYOPGgTiPIRQEMqx63z3VvLqtjpaGdYlVB0NPvdftrDXTDSCJCYq51VQ2JxTXkgCzhn80RUQ/Ic9RSVkA5NERD66E0e3nEWEHfLe65FTvEOlHn+3mJOQJf3XiBGI0CmucI2ObbqQS4IxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=PS536tpJ; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="PS536tpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777221584; bh=cANDvOAI2pgrvwKPwB8Hzr8idQq3CsfLLbUmglDWBhI=;
	h=From:Message-ID:From;
	b=PS536tpJdF1sJuy10oQAiH/9Y1DJ0EhpZ731dNOl+b+yhl78C96xDwraojUFnspY1
	 eO/L8BnDublE3/F65VtA/6y8ss8CQPHQ8QgERNHzcXbnKvknr8tyh9ckNlKIa5QoII
	 B5tmtt5PmEyj4sHLyCHJyCYKtAcl8Jg4e0l047OA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 88A72C0B10;
	Sun, 26 Apr 2026 18:39:44 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>
Subject: [PATCH 0/3] Documentation: security-bugs: new updates covering triage and AI
Date: Sun, 26 Apr 2026 18:39:11 +0200
Message-ID: <20260426163914.19449-1-w@1wt.eu>
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
Willy Tarreau (3):
  Documentation: security-bugs: do not systematically Cc the security
    team
  Documentation: security-bugs: explain what is and is not a security
    bug
  Documentation: security-bugs: clarify requirements for AI-assisted
    reports

 Documentation/process/security-bugs.rst | 131 ++++++++++++++++++++++--
 1 file changed, 120 insertions(+), 11 deletions(-)

-- 
2.52.0

