Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339724;
	b=M9fQGnqhh/xyKaNTPPVCLX+aWB+af+Z30MV/d9Bc6KlzVApW4yelpb9/57sWRwBYDjws
	 qq8aUya//lv5lo1eM/u5uhnjBwDyr5oq67bjZrNqPcfiBc/sIIGvt74Otec75W/gceLrH
	 HK9i8fmRh03VhlgZPeVdvDGHq6uw2rAfRMOOcpQ8ivLqMj7oFtIfP0/DLQfEEkE8tsev3
	 DU5k9lN12AyZMXFDK3R57/RqBWc3C/NQyrRnDIyq7l24VMAAQypEauu0H1tZNrimx0k40
	 ns9LW8fDNpNtsD4pTDrBQTTR2W8P9KlGp25jr5l4gUemDnEWGR66dtepkmlYXoTtxlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339724;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Pqtl4npWkphouNTE/kHIzbcAETdRulwAMb+Ntlny9Ss=;
	b=l/bkU6qCZMqAUI8FfiCtwrKDJQjE3T0Ils5fIVRUWimfnI8724twv5hJRws+F4zlFszR
	 wIcecG7eRxnI/DEa6sBozBTypftnIzK39I2qJPhU18JKl39DJOkP3xyrJJEOh6+e+gdr6
	 m+VvpFJXiHX+DF2RQsxVzJ9UlEN/bDsNVWNS/0KRZ0pyMx2MPqVJzZ5unzcHAZQLTsNM7
	 e+FAL7W9STx/SaSmi2Q66LgYBmmUEkvMebAc8tDDeCATeJ4PCwxOJQVCnwedBaTNSK+vb
	 mqxYUmQgxc5N0e1+mSTcINp3vHMVoVRmlrRWghZSzBo1kGJHTx4JaS6tVNx697KCf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QWWCNMYD;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C6606A323
	for <workflows@vger.kernel.org>; Tue, 10 Nov 2026 19:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52C6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=QWWCNMYD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Pqtl
	4npWkphouNTE/kHIzbcAETdRulwAMb+Ntlny9Ss=; b=QWWCNMYDGBox/JT2AfaP
	Gw5F1mJYcpz3xFj7cax/hxHCr0IHvNVEJ+00CPZmkOGGXzEY6i5p2WwbnFjRpRGZ
	nMx2MGFuvkSzhldqAFgylB8vrzUQQrtodFGLAh17OOhd6BOcTYBT7gpq/bzfPJJn
	SFLj5xdrPFE4kdTpw5ueDc0ZtTXhKnV7jBPj9J2/+HyONAWFBbdlgchZ7ldmQjpS
	bcLVBbnN/kSRBtDmcLhbb/MHRXe7OIlIBb27APdtFsDQotP+g3qUHjQd5vlUhoNw
	Kgb31cLkJemTwzxKL/+p2y7RipS0f5USd/K9mIc5ghb25zNiZZMsAiS6xBMxgYcb
	YQ==
Received: (qmail 346477 invoked from network); 10 Nov 2026 20:41:46 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 20:41:46 +0100
X-UD-Smtp-Session: l3s3148p1@h2bMRPFfjtwujnsO
Date: Tue, 10 Nov 2026 20:41:43 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3] docs: submitting-patches: Clarify partial review tags
Message-ID: <avNzd2dKIP2jY0t9@shikoro>
References: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>

On Tue, Nov 10, 2026 at 03:14:30PM +0100, Krzysztof Kozlowski wrote:
> Refactoring of driver subsystems or some core driver parts often come
> with change of the actual drivers.  If that happens within one patch,
> people giving "Reviewed-by" tag only to piece of the patch, like one
> driver, and ignoring the rest including the main concept of the patch,
> are not really reviewing "the patch".
> 
> As explained in the Submitting Patches document, the "Reviewer's
> statement of oversight" is for patch as in "entire patch" meaning:
> 
>   (a) I have carried out a technical review of this patch to
>       evaluate its appropriateness and readiness for inclusion into
>       the mainline kernel.
> 
> The sentence is explicit, exhaustive and complete, meaning it does not
> allow implicit variations like: "this patch or part of this patch".
> 
> Reviewing pieces of the patch while ignoring the main part of it, is
> much closer to Acknowledgment, thus Ack or at least "Reviewed-by" should
> be followed by '# subpart' suffix.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

