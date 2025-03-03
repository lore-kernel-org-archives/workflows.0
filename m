Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0D1E9B3D
	for <workflows@vger.kernel.org>; Mon,  3 Mar 2025 21:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741036167; cv=none; b=tYc05VyF2H45DONEu1pImiaYVZ5wsyYkEdzUjww/m5R3sjRiqR1m7bunP7B5NxXVRNkHqhnEy1Qr/YkAecqS55jI2EqqOK42MD3qVHoVSjUtnboZxcJ5uDuE5W297BvsYzpsP+DDh/aUoHT8S0oh1XDYVyttcHxC+KHxKjQigU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741036167; c=relaxed/simple;
	bh=dby6vQZgd+cbPYR5hZg+6Xsb051XIl/njF09c+MjFkU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kX5crTmcE5KnKrHrLYlFVYqBfAb+ER7aBbtK3yLUjALRXqx1oewZ+3+U8htDua3XFE5Q3EzEq1x7X2eRguKFvuWk2Xj1dOsJuiofx17pbz/H3SYyq3wUTba5w0rzoEcM4TTXH5oszBNo+deTfFq03o9tG/zaCzC2Ly/q9F/8ytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8gZ0JbK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8gZ0JbK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D18C4CEEA;
	Mon,  3 Mar 2025 21:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741036167;
	bh=dby6vQZgd+cbPYR5hZg+6Xsb051XIl/njF09c+MjFkU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q8gZ0JbKbnn2M1zFHyIYAqxa5KTDpTkaA97pQMsuOCoT6zQ8Bz5QBxGN1kG8/Rd/I
	 gmWSKwz+4/BAFK81af6HtuJzmwIuaq+2apxiCc07DkjmI41qiBJJyNIf3XdStaLTt4
	 rY/MvTdWAaapGtXkNnazx0D7WQtsE43PqZh4Lxa7NM+vLjfLd6+PLVd5zHt2K8LLDG
	 3h2LwDBGJ0/LPdEh+YadytntaN4RTQRgw2xgMVmIyPJVLGv4eabHx6BU0X9CyjXZAJ
	 yQhbgysujM2jq4owKUPskVDMpmZUaxlq4m7usSSFy/8aYWDySdSleJlqrbi1eJ7nyP
	 +PCvyLumNFBkQ==
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id EF501120006C;
	Mon,  3 Mar 2025 16:09:25 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-07.internal (MEProxy); Mon, 03 Mar 2025 16:09:25 -0500
X-ME-Sender: <xms:hRrGZ2fWcti5fIOl54Z5Xcso2OUKj_sWOqudmOL1RoXpjw75m2YxCQ>
    <xme:hRrGZwPwb5YsNNJgQ32rVu8klR9sPSV59BHS5YGLhL7mg88COKZqUFe1PDMNuxpB3
    IHhsFWfSsodgOSb4Gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfnfgvohhnucftohhmrghnohhvshhkhidfuceolhgvohhnsehkvg
    hrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepjeevffelgfelvdfgvedvteelhefh
    vdffheegffekveelieevfeejteeileeuuedvnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheplhgvohhnodhmvghsmhhtphgruhhthhhpvghrshho
    nhgrlhhithihqdduvdeftdehfeelkeegqddvjeejleejjedvkedqlhgvohhnpeepkhgvrh
    hnvghlrdhorhhgsehlvghonhdrnhhupdhnsggprhgtphhtthhopeefpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehkohhnshhtrghnthhinheslhhinhhugihfohhunhgurg
    htihhonhdrohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepjhhgghesiihivghpvgdrtggr
X-ME-Proxy: <xmx:hRrGZ3g7cHOPP7AkvPyZHPZpZNnbdZSyl_kgZ_vOyUEYf7sZx63xJA>
    <xmx:hRrGZz-OuiO_SCZhaUDQd7Ux0h9z3PqbnMjYIhA_6ymZH-EyQCaY8Q>
    <xmx:hRrGZyvvktIoADqO47dS4wR3t60yiu0SHX2Pr4yGLrlV7GrLuDIDdA>
    <xmx:hRrGZ6ET-_FlvDQ7tOZi2tHjhhhD-CGlPk0fc_4grM3D416h8NlvMw>
    <xmx:hRrGZxOTk8QuG4eFBoMBm8AWxbD8n_z7ggLyN-6gz7KyxS756r7_w2De>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BC7F01C20066; Mon,  3 Mar 2025 16:09:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 03 Mar 2025 23:09:06 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, "Jason Gunthorpe" <jgg@ziepe.ca>
Message-Id: <ff0f0f90-2446-430f-b8b1-da4568e77187@app.fastmail.com>
In-Reply-To: <20250303-impetuous-elastic-gazelle-dcd5b5@lemur>
References: <475dccf3-f252-4ef7-bfc9-45fd58aa4fff@app.fastmail.com>
 <20250303-impetuous-elastic-gazelle-dcd5b5@lemur>
Subject: Re: lei stores mails in wrong folder
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Mar 3, 2025, at 22:42, Konstantin Ryabitsev wrote:
> On Mon, Mar 03, 2025 at 08:40:26PM +0200, Leon Romanovsky wrote:
>> Hi Konstantin,
>> 
>> I have a strange behavior for newly installed lei ("dnf install lei" on FC41).
>> All new messages are stored in "cur" Maildir folder and not in "new" as I would expect.
>> Current behavior causes to weird situation where all messages are getting "O"  (old) tag.
>
> Unfortunately, that's not really a question for me -- lei is part of
> public-inbox, so you should send this to meta@public-inbox.org.

Thanks, will do.

>
> Best wishes,
> -K
