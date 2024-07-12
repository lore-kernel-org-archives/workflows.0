Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DDA2C853;
	Fri, 12 Jul 2024 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720808398; cv=none; b=QdxWiopyCAh04Wl8X+qfzwH9ARuTn9VqUASBbb3CVMYOMb6q33zSp7cUpsGa85u0Bcjd1eyomORpuZDnPlWf/cLL8Z0hv1+vo7LPOYO1W4TGkn/OHDh5k6fOuMfDEFvzy13hHJtUWsf3+0+yGc0Z5lRNS07a2x58wyLSnXeXS+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720808398; c=relaxed/simple;
	bh=+665+1vysIFk9g92KNraIZPtVvmymV6r98c40fNV0Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddXgK9LgdoCRxLpjVIeWRCd2PwO0T1L/AVKfdw6JN5DM5sSFZPiVKW/f08LottlhF8nlV31odx0IQC/PxmD3EPB3ZfuMRhdsKrlZPB5cYZ0+O6wRQy//+y0YdJdcekD9H1hZAxc6MCmdn86Ej38WVR5sVTksA6l4/ag36ImCP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3OfBHWsK; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3OfBHWsK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Yz1So3zgVGj8Yp6MxtAXqfCDD1kLAPP6zeU/lm8gjSs=; b=3OfBHWsKSv0cGuovN9Vi1gYg1F
	4PpVAPz9sedVCXQCzo3PLN5nQTUes8Z3NnEWLACGkMj0jyol2/A3iGtIj3YR1X00jqUg8Qxi4UUPj
	LC89uqCpgvCDqnODGnTzodHP5/wkET+SvmmA01oWZHV8gmh2KA33eIVIDn1erV3qBBLcBLsNRKKNk
	R4okLpj6LuwV4OaMmDS1RnkuDZeAQyvZdbgrsbyQ+DrGx4jSHBZXovb02S+k5azO/nNDQYes89FWX
	FpULAVzRTDFWJdhK5jlsjN4TSNalj1ytCDvxZlaAoD7HieAb60njlc6maDVeA7H6g+rXleJCkMWKf
	+YaemRpg==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSKs6-00000000yYa-3GIB;
	Fri, 12 Jul 2024 18:19:54 +0000
Message-ID: <98e2dab6-aa51-4c30-86b4-7e21410e11a4@infradead.org>
Date: Fri, 12 Jul 2024 11:19:50 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20240712144903.392284-1-kuba@kernel.org>
 <7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
 <1a30aea2-e8e4-487d-81e4-dda5c1e8665e@linuxfoundation.org>
 <20240712201156.1413e80e@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240712201156.1413e80e@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/12/24 11:11 AM, Mauro Carvalho Chehab wrote:
> IMO, the best would instead to give a positive message. E. g.
> something like:
> 
> 	Maintainers must encourage discussions and reviews to happen
> 	at public mailing lists, avoiding whenever possible to have
> 	internal discussions.

Ack that.
  with	s/at public/on public/

-- 
~Randy
