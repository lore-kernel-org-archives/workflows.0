Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C023726F29C;
	Fri,  6 Feb 2026 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770388708; cv=none; b=FHcpOpZ655hoongaoXokbZrrgKD2sdxCLwwZ/xzmsfQV8QkxgZ7mdvZC4SMxnYP0MaJF7I1ll/+QymS4Evns8azLnKBvLtZElXKTzWUvu50OAEUO+UK3QeZYafp6UoZGXwMa5urREWRBYr7/xgnHB2GhzbDQxnshsmAdA0LDV0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770388708; c=relaxed/simple;
	bh=Uu3nWCJz12guU5X+7743jz0SVinEPMfnsYWYHwqmZ6k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aMek2P5zjSVp1gk1wRlEVQcYd3vXA89UdsV9rgpQw4uQSCTIHZ0s0xaIDSoV0a6VKbBo8LUL0ZpX8eMc+4HHDmUey14jUn4wp3DwutZeSxmECXB64FU5JcO7cKvhAQPf10bsCvv/h8dutl1/xbxow/HMwyswEQzCg+hYISTu2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joRUVa4B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joRUVa4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28DEC116C6;
	Fri,  6 Feb 2026 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770388708;
	bh=Uu3nWCJz12guU5X+7743jz0SVinEPMfnsYWYHwqmZ6k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=joRUVa4BC4BNhTmnibZaDRnEet2zfbJL1+Hw8lqRAEwnRuQc9oKobKJHU5qmtzmYC
	 MhTJuQ8lPeCttZ2TUF2vLtuxfuAif5yfuHIbZSdK7eHa+IREnLlLwOOORtLhnVct0J
	 ve6oMr/tG9GYfC1Xfj21Fgx5qUEE9zLEjsvKa/BFATlGOzDLyijMs0VCOmXjcaJMqI
	 HMVD/S93aH36DZUkPdOn/rX6kZfP3y4O7YlXjC3w3sgLwkSo9pzVS96DEk7aVplbYg
	 g7CqnmrkbA2gggF/UV5Lv5D7303o+gupuCFRfb+5gDnpTqrQXNFUkC04/aCQT9UWmG
	 V3RaFvvJHCnVA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C40F8F4006B;
	Fri,  6 Feb 2026 09:38:26 -0500 (EST)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Fri, 06 Feb 2026 09:38:26 -0500
X-ME-Sender: <xms:4vyFaSbIsHlpu3vNO9w_gIdsontmqHY3cau9vSztzJXKhVQt93RsWw>
    <xme:4vyFaQMwrvboTpkJz5ZoMqYXieHnq1N6AiOvQi0DJZF_84PMOGPTR2XFGy7ChduMx
    hy3-3hADAjgzOpXeswjkCPVTG2Enouai_vVehJkW7VtfudFOEI-dEI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeekgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfmfhonhhs
    thgrnhhtihhnucfthigrsghithhsvghvfdcuoehmrhhitghonheskhgvrhhnvghlrdhorh
    hgqeenucggtffrrghtthgvrhhnpefgleekveeguefhheffkeegffdvvefgheduvdffudet
    hfegffefjeeivefghedttdenucffohhmrghinhephhhtthhplhhinhhkthhothhhvgguoh
    gtuhhmvghnthgrthhiohhnrggsohhuthhhohifthhorgguuggrkhgvrhhnvghlrdhorhhg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhrih
    gtohhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieegtddtuddvieef
    qddvuddtgeejtdeliedqmhhrihgtohhnpeepkhgvrhhnvghlrdhorhhgsehkvghrnhgvlh
    hmrghilhdrnhgvthdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprghmihhtrggshhesrghmihguvghvlhgrsgdrtghomhdprhgtphhtthhope
    gtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihorhhkfhhlohifshesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:4vyFaROFZu6HrFkwuSGwKe4YcP5WfWBch6AcThR9R0gpGTKj36AUjQ>
    <xmx:4vyFaXr8Krxj5BIxCz4-qkYYtCd9ibwJRFZ1kAoWMvK4bWTJBfP-Hg>
    <xmx:4vyFaaF2XpJm5R8qI6Pq214muMBEl2gKrKLHSmpMjI-bpV4aEaKIFQ>
    <xmx:4vyFaUqYJg9XID5QVIpl706WOs2uYkUf7toYGt8pz1-TeWd1g3iYAA>
    <xmx:4vyFabYi7xZU9lhIUKdvwQu-7jcn-4m_y_gcFen9bCsV054aqGDhH3yN>
Feedback-ID: i40364868:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9E60615C008C; Fri,  6 Feb 2026 09:38:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATkCmAgbOTdR
Date: Fri, 06 Feb 2026 09:38:06 -0500
From: "Konstantin Ryabitsev" <mricon@kernel.org>
To: "Amitabh Srivastava" <amitabh@amidevlab.com>, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <95e18b9f-1426-44cd-a5f1-fca5bd122450@app.fastmail.com>
In-Reply-To: <20260205115554.7795-1-amitabh@amidevlab.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update kernel.org docs
 link
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Feb 5, 2026, at 06:55, Amitabh Srivastava wrote:
> Update http link to the documentation about how to add a kernel.org UID to
> the maintainer's key. Add missing SPDX-License-Identifier to fix a
> checkpatch warning.

No objections from me, but please check with other reviewers if they want another revision.

Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

-K
