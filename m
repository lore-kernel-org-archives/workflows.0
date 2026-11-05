Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877561;
	b=ajzFlv3XxDvA/MzWxYfZOCYLsc6OOON8gvSwG7mCEnBlk7nQ3CvjDZfGbHZBnznQ8BDD
	 9re+V7nNGeRh//Bo2xN0c2pZza2OGvx4wEmr5r9m+kO2LCXjIkogi18ZN6bpsFZ0fBwf9
	 dq/ALDg4H3pp8z6k2WGnPZsKHH8b+33VG04i7raytvgFCrAb6rStPGXDguLJUT5Fn4EI4
	 CZmemTIhGsFQZjzkfEgyrXk8Av8workkaTdX3MnWocINCygjAvRAPwisFDKqF2fFzAVMN
	 JV6CuCsQPDIJBOEOYU6W9NkKv3+V50z3eeVBR6RqGa8PwevB9TMh+16WhHbKatlUk1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877561;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=f7h6gBlslVqG7tbJ4NKNy5E8PQorstBk7bEnOc9Ii70=;
	b=4SxXWB/xtVH3///qKj7rBdk9oiQ5vKbFwJLi9H9B9lUPXlDWiXLpEA1pwkS1jhy6z5IQ
	 3ywlDJlLk+kxY3nnixaCMZr/6ocPjKeiPg98yiBesrfSGCzRZlSzZCuyg9EN+GwNrqoyJ
	 xMF2LrZtpUpbKwAw45syeFNos8AOt0XAtpSpypRYQbJ3DLm/ehxq/PmjdyIsoIlUJ4UC8
	 7vcfXDbFCcnlElnEWs8MT757qt1NreVv6ldrseo7i9M4QOdBbZI4NorXMqfWr2AhlgXss
	 K5WONzaRpxddJkd7zBUtFke9dGDKETg5n+NAHhvH83/vOFvXGO/tW7QbGQptQhjSy0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=C4DcSk2c;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD3C606A329
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 11:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AD3C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=C4DcSk2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f7h6
	gBlslVqG7tbJ4NKNy5E8PQorstBk7bEnOc9Ii70=; b=C4DcSk2c9RUYHZxspnaI
	Sv/p1P6KOhe13F8STbK5AR0eHF+l+HFqqGx0mo+Qkl1U1MHMHgawnK6jTwWfpGDR
	RWg2iN/pGPdGfneUtVlzncw46mwZgfIehr7NLyk/1FSLFGTqz3SWFxcmL4utpubm
	F6qSC6KfBURE7z3knzfHTXlmE4MzVI0NKKcOeYXAVPyxWVfoX4vTa63UAE8Gv8H1
	8gYEg9qNNm2Tlejdgo9ci83cpdD5lp/WUis3+zczyn2gjh0WERP3uS2xhX0m4NFP
	7EPu/CwrlMHLvJaC1W6cA1hdY+Nf8CSe4I9C/kAx26p1yODGu/rK1vHxsjDQjny1
	cw==
Received: (qmail 1125246 invoked from network); 5 Nov 2026 12:19:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 12:19:15 +0100
X-UD-Smtp-Session: l3s3148p1@h6psqoVf3pLAwtcC
Date: Thu, 5 Nov 2026 13:19:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxmMrANvWIJi94i@shikoro>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
 <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>


> >> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
> >> found acceptable according to the Reviewer's Statement:"
> > 
> > So, for the SPI patch: if someone spent time and reviewed the complex
> > core changes, but only 2 out of dozens of drivers, this would be an Ack
> > according to you. I would, however, understand that this person doesn't
> 
> No, and I explained this in this commit msg. That person reviewed the
> MAIN concept of the patch.

With that MAIN concept emphasized, I am okay with your reasoning and
agree. Before (I cite, upmost paragraph) "*the patch*" could be
interpreted as 100% of the patch (including dumb driver conversions).

> "Reviewing pieces of the patch while ignoring the main part of it, is
> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
> not be applicable."

I agree. As stated before, I don't care so much. I am glad you do :)
I'll happily take the "# subpart" potion of your patch here.

> Nowhere in my patch here I said you CANNOT review part of the patch or
> cannot even leave Rb tag for such case, right? What are we discussing
> now, exactly?

I hope the misunderstanding has been resolved in the first paragraph.

> Do you agree that if person skips the main point of the patch, the hard
> part, and reviews only less important part, that looks more as an Ack,
> than Rb, considering how "Reviewer's statement of oversight" is worded?

Sure. It is not so important to me, but yes, I agree.

