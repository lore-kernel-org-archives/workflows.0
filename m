Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2AE283FEA
	for <workflows@vger.kernel.org>; Wed, 15 Apr 2026 00:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776213912; cv=none; b=eI5Qt+NFRu7VWGmrYpZmxyzhzvS4tIUQDgGjsuS3DOBsQsO5tSkdC0Xh3JyKqX0x1VbdMy0KMQtttDjY04TLsYRVARa8fjbSNxrZAfThAx2iELGKSsdeq9LCRgjztydSVbQJ/AHtoo44rYCCoCwpY/U9XE+DBaH8NI6dRmIQcHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776213912; c=relaxed/simple;
	bh=qejLFQQGcg1KVqXARzAXhEpre213aSYvl+SOgejiSpg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=aLwz4d4JYrayQVaoHj/zZ2LzHUVy/7KziXnMaEVNEO5YZTcadw1BrgAYtzCLy0R5Hqi0kZwVuvvK1Cmo5bog0pqI53CQKVGOJ6wNa4LWkV6qJfIRbUOR8K4eY/5boQm8qRVnet61eMK2fGSHpdT+yZUNq68N1zbSp5pJT869qeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mwe1inbz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mwe1inbz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0DAC4AF0B;
	Wed, 15 Apr 2026 00:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776213912;
	bh=qejLFQQGcg1KVqXARzAXhEpre213aSYvl+SOgejiSpg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Mwe1inbzktTgLt/Ki7sWdn96/InJQ3XFIi3j+t/Dwnh4mtLj8psRP0tzqc8iREo8i
	 eUFtu2jSUTkIYQyX+VRoEAuaiIiOBvO4LCS7N8nEBPcQwnAlNZufTkxmNhLWV7o4Pm
	 eNwozaYefQ/Zen680KJxd+GvKxcdRiaqXQNXy4LlNG3WynY+P4Gj6CuPPtPgzUtdSP
	 WAjP53EhmhuTM2iimMBMPbHMzY6jwYc3pb5sgRyGMHU1t7C01ifZp1pVzFXStgxlSF
	 4r7A5YzgxnsyEhFP9ywurntZZgd/3/cD3G+Gd4eBLGv33gBZRMhndwcMMBPb/qZlMT
	 x1/7fP+l7CQdw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 11EA2F40068;
	Tue, 14 Apr 2026 20:45:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 14 Apr 2026 20:45:11 -0400
X-ME-Sender: <xms:l9_eaalaIa9eyXUeOmkV1U5zninPyBhUKwVoAdxTCiWTF6X6g6YbGQ>
    <xme:l9_eadrapGeexf3sgZIrl692jcXkhZoDvoVuxOfyuJvsYcS5ap56lLaxQYnHTladk
    EistXuyI7nUOxLdnzfV6X-3MDlCXgl8Zur-dXVrhxOFw9No-E5VcUE>
X-ME-Received: <xmr:l9_eaUBEGtPNq-fYupTumRHN3cAqG8PNcey2FK0raEJ8eDLaKkCotaswibKxyGh4VCCxNMdr0TW-hozXb97cRsUlzBx_mG1YO-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegvdeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    duvdetgeffhfeftdffudehtdfgffejleeffffhvefhjeejfeekffdugfdviedvgfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepughjsgifodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqddujeejvdeftdegheehqdeffeefleegtdegjedqughjsgifpeepkhgvrhhnvg
    hlrdhorhhgsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepuddupdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthht
    oheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrih
    hstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihorhhk
    fhhlohifshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegujhgsfieskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdr
    ohhrgh
X-ME-Proxy: <xmx:l9_eaYHMLhmTMgXwROTjmYswnHADt465BbqwIBGVSPzEnuUYbOI3jw>
    <xmx:l9_eaW2PH3Ay1C6xJK39bR1E3YVdXlPT6OKZuNKN1xdhAws3ZpnQ_Q>
    <xmx:l9_eaRPRxgEzKFqJHnflz9zCNgs1WiDt_7IplSW3TajU3OHfdtzw2Q>
    <xmx:l9_eaeYkm2KzN7NQ2HezUGVjV-QizG-5q-5ucLaeOD91aC7HVBeioA>
    <xmx:l9_eaXzYpym6Rq6y3s5WA-MQt0zpEYPcSjGE4QDyz6gKlP8t24auZEeS>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 20:45:10 -0400 (EDT)
Date: Tue, 14 Apr 2026 17:45:09 -0700
From: Dan Williams <djbw@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 Dan Williams <djbw@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <69dedf95ab1fb_147c8010048@djbw-dev.notmuch>
In-Reply-To: <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH RFC 1/4] docs: maintainers_include: auto-generate
 maintainer profile TOC
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Mauro Carvalho Chehab wrote:
> Add a feature to allow auto-generating media entry profiles from the
> corresponding field inside MAINTAINERS file(s).
> 
> Suggested-by: Dan Williams <djbw@kernel.org>
> Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Nice!

Acked-by: Dan Williams <djbw@kernel.org>
