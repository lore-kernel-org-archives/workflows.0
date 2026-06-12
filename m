Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F313364022;
	Fri, 12 Jun 2026 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251324; cv=none; b=Nli6cQQ7JbmZgL+yTCTII9z3mwNcqVHRS2xAr3OiBQCpIJmqoZDDmMEZPXDQrO/9bdHuqp4rQ0O6ANRivIFdCmrpUAnxT4vEemruQc5xrSFpLVr18b1HzdPXxLKzuD1M0I0Uwepdt5QChDKsDoDYQ7c25bKOHdBcty0aQZ1R6us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251324; c=relaxed/simple;
	bh=7K+SFK0rNv6JEv5dpyKf14EK1+G+pfIxfEdilNG4JAs=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=u2iqn+L2wt0OeabJcxU5twNasE3q+0xMRnXDgrkFkccFXodI6zBxMVsf3Z/FJMti9koLpPPhBbLCdYzfzF30wLjz2pCjy/ZS7ddAxaiBp0EJ5VlzVJWcFLIp4Dd2OHHZT+fKT5dMp6A4rKBWoY2KpXHczsy7oZ7Lmwfwsrq9+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wrgXHzpr; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wrgXHzpr"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gcBn103G9z9txS;
	Fri, 12 Jun 2026 10:01:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781251317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7K+SFK0rNv6JEv5dpyKf14EK1+G+pfIxfEdilNG4JAs=;
	b=wrgXHzprT1shr1tO/OmObdZlMrIZSexNBS1EbU7K49RE8HriZ0lwR/C9zHzZu9KVgu9Qb3
	T6u2dnhnBOl82eQUo4A3lKeprJFW/KiAaarKih1ZpAbpq/dCXKKZkIxsqvq8kB7gqBOQqG
	Jmrd+4v6c2Fhu030eObLX8GVBBqlyYcNlt4ETB5zSyvcYaaJnxowolJjXQZrzkTPI6Y+wA
	HSI+qjsDTBVfvaaadp74Ko8A60/vi00Y2yDQBUOjf8ski2Ygy27gYnujZGhm7AMwoXw5FB
	nG96VKLF+jQYXvaUE88fiYTWHSSX48LoxG9uapRXyq4k35tw3r+sMMbhW2Eb0A==
Message-ID: <f55eb34b92a01159e0224611296fc51fcfb5ec5d.camel@mailbox.org>
Subject: [Question] 5.posting.rst use To: or Cc:
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  "open list:DOCUMENTATION PROCESS"	
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"	
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Fri, 12 Jun 2026 10:01:53 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: d59b68e2dddb2ec413e
X-MBO-RS-META: r5kkcr87msn8tmj6n3nm4ouacy3kp11f

Hi,

so every time I send a mail to lists or maintainers I have to choose: To:
or Cc:. I did look for an answer in the Documentation but couldn't find
one.
I think if there is an answer then it could be added to 5.posting.rst .


Thanks
 Manuel
