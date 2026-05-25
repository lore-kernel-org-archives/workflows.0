Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92BA26E6F3;
	Mon, 25 May 2026 20:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740349; cv=none; b=js3a+KpKTHxiPY2rimNhHloQU8aaa0j3ETNb1sO4gFf/dyooKQYAiN/vjOoGuEfAfsrnhdW4xXCPHT7KYe7xGhMaw3sJrviIqhFbIiq+iFvMJPlyDPWEh9yI8pxG0o5g/QdZbQBV0qiez16NOhGJw0/0zxn7avyXqsTx+bLwcvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740349; c=relaxed/simple;
	bh=OJzLBQXRNfX41+rG2tcBBuQphT+cB+WzDAJKt4hK0Cc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZZlfYTm+5u8ABLjDPMkWP8xmsYyI/rZwCn5wXwD1tFSkWaqDYnAvVhzCiRarmMWfsJE7s+jI1lJLXUd9MOlhwAOPoHLm84nmN2gp1l/ykN5Vcj7198QuYi8v2oawnPUVpHoagMcNup/hzMJ0q8eDu2Pf42CAfpsPeLpq6/qTjNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=F8URCzRe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="F8URCzRe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3A66940B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740347; bh=KTrz0bQUcP57rw9behi2U8TCPZ0XQ0KUCFa7xcBxbl0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F8URCzRetKBv4g/QqhWTLtR7z8omzD3rlyz38ONGcOIyW1MltU6YZQER8jjYAPEST
	 n9Zm/ynNb2Zk4rtCyx/++64du70t6JwSRJxKPGCWy1qqZTdBbJSMcWYPLz0o3M6IBn
	 GcQ6S8Xd1NXEfriChK78UMkZmxa1i87amL0b8BOUjyIirO4DXLPrlZcQnHm/8JInrm
	 uzGEFPmV2VZ9Ql25oH3XXSG0th9FWOuOP1ZO8thFpre1/oPEPnPQ4BuudNTin0OtBG
	 FoENgitEWkorBScEKRtAO/dwBQNCnIprwShD3M4YGK+LMNUC8+aSIdYiXgJE83tLRD
	 ZGi/Q4y/7mK7w==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3A66940B0C;
	Mon, 25 May 2026 20:19:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, Baruch Siach <baruch@tkos.co.il>
Cc: Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: threat-model: add missing closing parenthesis
In-Reply-To: <agnm9A9SFsmvIFZg@1wt.eu>
References: <da8ee1e8b4e99261ec11544c4e1a4f81316ae965.1779032501.git.baruch@tkos.co.il>
 <agnm9A9SFsmvIFZg@1wt.eu>
Date: Mon, 25 May 2026 14:19:06 -0600
Message-ID: <878q971but.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

> On Sun, May 17, 2026 at 06:41:41PM +0300, Baruch Siach wrote:
>> Fixes: a03ef333fbd6 ("Documentation: security-bugs: explain what is and is not a security bug")
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>
> Thank you, and sorry for this mistake!
>
> Obviously: Acked-by: Willy Tarreau <w@1wt.eu>

Amusingly, b4 turned that line into:

  Obviously: Willy Tarreau <w@1wt.eu>

I was tempted to leave it that way, but decided to fix it up :)

Applied, thanks,

jon
