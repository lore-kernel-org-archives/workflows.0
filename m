Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723667080D
	for <workflows@vger.kernel.org>; Wed, 15 Apr 2026 00:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776214086; cv=none; b=cYTQR+13ua+cJi5EuKJ6+MqHyNnXKLiHFizz3treWAjgEG/Gr28HqsfVCnaHjKqdWH7AlCEenZADoPT4cSQUKGRckmpndjt52webANdS4S3KmUt2loXHbjgBlhKr6u/Z41yL/PyJTXhxxvYR+2O8JBwF9m1JrSwWRBr8oIpdZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776214086; c=relaxed/simple;
	bh=DWK2jqzjxVgqEHi6UvrmQGN4fzX3aAIUmoaTpj/VETY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=l+9eEQFP9RQE9f6wi+f7bCz6VEOqQP14pg/wwcTr2jRrMsdcXBInZXi+ykfIo+ObyOqpTksMv0Uu7NzCFsKw3uUnUKasiNXyVaql7/mkP/ZHyj7EQGlPX19/wNaneTQs3yxlubCxPKcLnbIwEO91VMPL70nRhwF38ob6nEygbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/1P/hYS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/1P/hYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED36EC4AF09;
	Wed, 15 Apr 2026 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776214086;
	bh=DWK2jqzjxVgqEHi6UvrmQGN4fzX3aAIUmoaTpj/VETY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=T/1P/hYSvCIhT7LQQaeKB+Ie7V2L3cbY9wjCWRSqKOJAla+ISg7DzJfV3MUPnVlLU
	 2T3Ye8B1sVn/NiOlI0LseAwdK7TxFUGUXNWGgNBXCvm0NyrvthBHzdBoLqgSl82y6M
	 H0KuIP8OKrxyzMvBFiDcYYHCfMOJYrYdecFuXv5lwprNG1GxlSiQ+ker/K5Rsr90m/
	 DpIMdT4qJ5BKqWOz6jUrLiWQkKJfDIaT8KDRm9r12P0mZVP0vZuNcrqiIi2IhDU5cj
	 o9ffZdsfhOhoBNSvP+8qMti46cx5g32rpD+aWKcdz0AqfhoW+fWlShunv2BQF+u6sC
	 vSsI/o6lCVvmA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 09B6BF40068;
	Tue, 14 Apr 2026 20:48:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 14 Apr 2026 20:48:05 -0400
X-ME-Sender: <xms:RODeacsci5OuPgBZ-vJWOAsTViIa31tcfMNfmiP_3QuD2ltj_-y6Og>
    <xme:RODeaWCLCdtPcdNXqaFHAB81P3e0U7BYAUtrIpg05PNHMzAm_-Je4jQWnsKWR9URI
    MeYoxW3PGQ1FSPjNI5ookcMa-dCD4ah1jDuUy2dwhrZ9c27ZEQC-3g>
X-ME-Received: <xmr:RODeacPQbgZgAOdRPt1Pb32Yr0sdjtdvDfyLcjdrAhd8lesa8out_V0wsb5iCL6X5Kml7sOEi6SnsIRG4EIAhF4adgSLw9qQdSE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegvdeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elhfeiudfgvdeijedtleeltdduueekffejjedvjefhgeevjeefueejledtleetjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegujhgsfidomh
    gvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudejjedvfedtgeehhedqfeeffeel
    gedtgeejqdgujhgsfieppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpd
    hnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghh
    vghhrggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvg
    htsehlfihnrdhnvghtpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihorhhkfhhlohifshesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegujhgsfieskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:RODeaWAW9woy5wspRtwKduuU6jAD5TfVeiK6NOG_zcCMPmcYWdnMOQ>
    <xmx:RODead6e7OVVWWw1DGB5FTnfogcma0dXlPHpoqhOppoIorsl6pWtHw>
    <xmx:RODeaQ6QJU6A9uT6vr5dH3n6xPvvgfc0HhymvonwNPV-hd6E4dnTbw>
    <xmx:RODeafRSE4rFFNBKxCHm82sM5PHfrmmuRaA9PNFcANlQxd8dk2Radw>
    <xmx:ReDeaY-aI_oI-uyo3MBw9K7H9xviEJisqyjvuUPg7qRx5NnrrZb-puID>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 20:48:04 -0400 (EDT)
Date: Tue, 14 Apr 2026 17:48:03 -0700
From: Dan Williams <djbw@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 Dan Williams <djbw@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Message-ID: <69dee043762e7_147c80100d4@djbw-dev.notmuch>
In-Reply-To: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH RFC 3/4] MAINTAINERS: add maintainer-tip.rst to X86
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
> While the maintainer's profile for tip is there, it is not
> at X86 maintainer's entry.

nit. should this be MAINTAINERS since it is referring to the file.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Dan Williams <djbw@kernel.org>
