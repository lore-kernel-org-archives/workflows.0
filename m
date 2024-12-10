Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32B91A2C25
	for <workflows@vger.kernel.org>; Tue, 10 Dec 2024 14:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841045; cv=none; b=GrUFSR0+oXsiEsP5ML8+Ki8oXrOAP0L+1utVmdOXK8kvVoS2xVplvX7foImBQmcyI1JTs6Oum4jeQHAfNqPFXcWur3DKfT8NVLOOhoHB8ZFjxFN4QivDa/t+eH9SCaj9jtvBLEGb5fHE03LErrhxWq8kTuZyhFWL9kxgWLmN6Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841045; c=relaxed/simple;
	bh=TmKNCI5crBsnuoKu79pQm5kUHEY7ldggI2M+CYfFJUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOd1H3D7JdEYmly5+tZ0yMysHMie4pVtz+FLLpW09ywiJmE9/XaHswt2fQj9KCfj2FQzG35dmpVEe2JpBvSVuqCTXr/A+P8KPXn4743Kbegk6Ta8KqLqyeqHIgCDF29xymxwmvEbUjKTknZeSErRp7B4EP8ByopzJi7DX1BDqXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FA27LtW7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FA27LtW7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so2398852f8f.2
        for <workflows@vger.kernel.org>; Tue, 10 Dec 2024 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733841042; x=1734445842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W/cm+nrSG+5II0qAA1CApN1Olr5UrAZOBnUEX4G2C9k=;
        b=FA27LtW7gseJNuwxkZexH0iL6PR5Q3/Cy8LYRD0oSYV2n2+HzUof/akhPd4/zzlocB
         iKaMQ8mrKNjo1bVsZNupePBGJjANG4u3Pu8wrSawNqcRLJK9gDmGqXC7u2Zwr0TMQaC5
         9N6bKGifjn2LAileq/bRtm3lMm5+7KmGVqqSGkU6UPjsR4zfoE5X22RtP+UeDL+lwcGn
         rnayHhRoWeLjaL+LzFxOSAa48EqHrEyhcd4FA/BYbwQeG4G03fU31qLBjJsr9sivcRyo
         9Vpn922atDVpAjANISb0fvsePwRbOebtzgWZmQyqgUCrl8irnKijX3q9SfvuaUvUgojS
         DdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841042; x=1734445842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/cm+nrSG+5II0qAA1CApN1Olr5UrAZOBnUEX4G2C9k=;
        b=R9gpE9IoUccr1WKsQp8UGo+mZirO9UhceOTYfqPMkFtBQYdXDpXq2W9CNOvQTEtXE0
         tCaCcg/perm123Jk4G405nBQ1/4+M6PfMC0uM68aufSU2fM2uTpgv4TOb1n2E7od+wXA
         DGtdrdFavwIoguzvuCsRhcuDn+vuicqQo/YfY71KnmDVKvTNTbxhe+s+R2nLZMJ5lhxC
         PAAfPih+UqKxZa710YiDjRn1F3PFEi9W3gW0DpAPJgIuBIXm/f2G7eRPomeKsoRfpGsL
         hLIAiN0daKx2+BZOSBXZYO4zb/wIbwENuH8hdtxQpN8k5ZqUPPWo2FQ037Vnr03baPf7
         3ErA==
X-Forwarded-Encrypted: i=1; AJvYcCVgkbJdC+oQtcQCcHRamQIewokIR4w+Z3hNgaMV/zIaOC3qmPfqHiGqfUisGVDtLuVvinyRlOn7EY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOBxrTE4ic/Ol8lV2Y1WUM/GLvdklzyHsJNTEYNWHR06mi0azt
	gvnjUAi1+bk9UxW/y9oBalDvxhx+2rlToeiCtI+bKeQypawRh7aSn6V//9xJSik=
X-Gm-Gg: ASbGnctS/H4P8gDpY0TIhLaTwbr6Oyb5qsxV3++YUdlxbmKqHojwVwTOJo2LTJtZ1ng
	O6Oap0rgAa9EEp0iO/e2CskHhzPyNKNncb4ZY2m54vBc8MQk9iiBg7q75KmGG9f/AFNxYfS6qX5
	ly+ZPzgzx81kdjLl5/K+oa7/ir1RqKyIgN1jz87C1ggRCRLk+ytnRzGovfPtUPwf4qMBBNCcVbR
	AMi24xPihrpMCqgFQSO8ilcZ76TMQpZbm8VecnNaGj+Ie0wm3KDF8I=
X-Google-Smtp-Source: AGHT+IEJUtTpPMf6G7jAGMibFprqv06Na9zpQvm8dtsXFCJXR4j5vR2w2ykd5ZBdmLcAr/Bwz0G0XQ==
X-Received: by 2002:a5d:47c9:0:b0:386:3328:6106 with SMTP id ffacd0b85a97d-386453e5101mr3654337f8f.35.1733841042098;
        Tue, 10 Dec 2024 06:30:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216688a6d8dsm21735495ad.163.2024.12.10.06.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:30:41 -0800 (PST)
Date: Tue, 10 Dec 2024 15:30:33 +0100
From: Petr Mladek <pmladek@suse.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: shuah@kernel.org, corbet@lwn.net, mbenes@suse.cz,
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] docs/kselftests: Explain the usage of
 TEST_CONFIG_DEPS
Message-ID: <Z1hQiQM5FbSVpiEy@pathway.suse.cz>
References: <20241205114757.5916-1-simeddon@gmail.com>
 <20241205114757.5916-2-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205114757.5916-2-simeddon@gmail.com>

On Thu 2024-12-05 17:17:55, Siddharth Menon wrote:
> Update documentation to explain the TEST_CONFIG_DEPS flag in lib.mk.
> TEST_CONFIG_DEPS is used to validate the presence of required config flags
> specified in the selftest makefile before compiling or running a test.
> 
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  Documentation/dev-tools/kselftest.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index fdb1df86783a..e816b282363f 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -301,6 +301,9 @@ Contributing new tests (details)
>  
>     e.g: tools/testing/selftests/android/config
>  
> + * Use TEST_CONFIG_DEPS to specify required config options to be enabled 
> +   before a test is allowed to run or compile.
> +
>   * Create a .gitignore file inside test directory and add all generated objects
>     in it.

It might be a matter of taste. It is a chicken & egg problem. I
personally find it weird to document something which does not exist yet.

Please, either update the documentation together with the code or
later :-)

Best Regards,
Petr

PS: I haven't got this mail. I have got only 2nd and 3rd patch.
    I prefer to see the entire patchset. I suggest to always
    send all patches to the same list of people and mailing lists.
    
