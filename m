Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665A47ECCE;
	Fri, 14 Aug 2026 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731396; cv=none; b=CwSrnbU8aVZ0c0xxS244ViP8O3npCL75zE1/5kQaMRL0B6dRt3hf4X4kXT3Qw960EKtzAUUlqr4euuxGeonYX0OQkWV5HLOosnbpQNlMgTVVOhXdZZZ+xJ/nB1Id3VJG1zpc9wqL2moCaQni2mmILhySC1dODs/jtZ1xhhJy8s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731396; c=relaxed/simple;
	bh=fQ0u6vEToOlwDNnCYD2I/zW8ZUPFRTCifN8DmNxJROA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G5VKdS5/VNG4NnS9JS+Mrt3O1LPNSKoKy8dHCh/srJHXriG8U4uSmh/yaPnkHJ8EtKwu2YhFHe8hedSoyz75yjRHdsuuNk+XYR8sXuxwPUKdaPpHKRMqhH0hqTk8VuSsf9h5VhYZUgiGinqGnSdLh+2x8CnDuk4KfDyuYzDIX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=upOebQyh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="upOebQyh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=uy0GXcrJxtWKpVBjqTQSEtx6wOeLmTtR3K5lpnjREyA=; b=upOebQyhAaUQeNNoMoJ5Oh4VCN
	AFiObFGAxYDT1R396gmsqOKmzuCgSPv1abbxsNZb9njhelmITwEPwdJuB5XpBUat7OX3OZPW2Zs4p
	CKSDfHp149noAaZKh6gc7nWtCwGHCCyWyEVlYmiUKGJxOyaVNs/b29JK0s3edqEkIEhgsZazJoA4H
	z5GG/x6Q3KEvRO/gMHXTHKLzz7zMwBtEs5Q38bRx5ipKZ4ypc0vsFniBIWUEvh+rx4cV3Uumq8jrh
	G80KNnfLAWhtUxvWHCSrMYWJW0zPQx3ozPYePd1g7RED5IF7A3fZdVTfrJlcBRjsnOV2WvMfas6ti
	GK2G3ejw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuwSE-000000031mX-1CyC;
	Fri, 14 Aug 2026 18:16:30 +0000
Message-ID: <af476e95-8382-4714-8764-1ba840ed252d@infradead.org>
Date: Fri, 14 Aug 2026 11:16:28 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ver_linux: add comparison with required version and
 add rows and colour to output
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260814143212.2288631-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260814143212.2288631-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/14/26 7:32 AM, Manuel Ebner wrote:
> Add the required version from changes.rst.
> Add code for comparison and print '###' in the respective row (good, bad) and in
> the respective colour (blue, green, red) depending on the result of the comparison.
> 

I find the dark blue difficult to read (on a black background).

> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> [v2]
> add colour reset as Geert suggested
> change output to take colourblindness into account
> ---
>  scripts/ver_linux | 112 ++++++++++++++++++++++++++--------------------
>  1 file changed, 63 insertions(+), 49 deletions(-)
> 

Other small-ish issues:

binutils version 2.45.0.20251103-4 doesn't fit into its column.

Not so small issue:

The version number comparison doesn't know/care about decimal points/fractions
etc., so:
gdb                 	16.3	7.2			### <<<<< RED
because 1 < 7.
and
GNU C               	16	8.1			### <<<<< RED
jfsutils            	1.1.15	1.1.3			### <<<<< RED
Python              	3.13.14	3.9.0			### <<<<< RED


-- 
~Randy

