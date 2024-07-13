Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9616139D16;
	Sat, 13 Jul 2024 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720880915; cv=none; b=cz54kqSU6RX7CRMYJ959hfNb23L+KnCkjyxZv8FDsRtt/8rRbMmx8X9h56UzsO6ks/43WIJpEmL20NP2+/7Qo0Tg2jonHBVnjatlw+XC6ePNN8csWU9xk6yQ8U568xUfnc3C8OhbMQcC7TtDFsyaTiebUjMiGKFHX4KGM4EM5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720880915; c=relaxed/simple;
	bh=Rvv6ZJDl7vXRecG0TM7jRooNONdDnYIayjdjkPJaeBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjlGOSAzP7XhqfqHQoox4HAHcgtsjHYagPCO6//kc6R4MdtnnwhUVCHiGEI93d6mQkaIU93mpbiDW4fOkRKN6I6NZfmvQR7zz9qRWpKCKMjYV3HqWSaE/BNc/s1PhoAapXPcx+OeBSzvyXTaISKAzLnR4I+k2vCOXjJJOneR120=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwW3fg/l; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwW3fg/l"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d9e13ef8edso1769884b6e.2;
        Sat, 13 Jul 2024 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720880913; x=1721485713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jc9f0NWPwY3S80RCBiIfAhJlnfaohDNjSXGP81ml0YE=;
        b=FwW3fg/lsV2S5YjbevjU5jEi9sBkf4JYOyAP1NAONkTIWT+ucWj69Q57K6JuLGdMB9
         B4ZxaJMjoLkGSK1IMOvGH6gWsSwcvJOvtStRgOUN81JUNppRgmYS1kLyFUTN0jw1gT7K
         ZI0FJpnF0kFuYLj4HBIz9EmQC6YBTDJnirRthpB2SrD9cxuReC5iWayfbS7rf6JarDX3
         +3vu2o8wJ7uvM1Riyshw9FAXj/Wu3SqzLC6oJfR4WSKU86+Sw7Ajv5JES/v/xHug4Rnu
         7fbv1OWQm8p+E7LjO3VsA0HUBxgYm4FQcpDSoyfegx+73N01I+AiVtWXGNKGGlUh4HxH
         bATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720880913; x=1721485713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jc9f0NWPwY3S80RCBiIfAhJlnfaohDNjSXGP81ml0YE=;
        b=AQvjlESWlOYdl75nMGUIkdAgCUnIv326Ubeb9TtDJnmPcpwb+9Kbpci9Mr+2BvU+lc
         fgo2i3n+SRPgJyopgxGmygtOJpLyUs06KTtlPSPRR5US2m7gp7JaYaicm3g75a0K7S3P
         XJNG1xGJ1iwUadfLjyU0Wlhgy70rfFzPt2Pg6u3FSFbL7kSNXZKeFf+Tu1Kguybi/akG
         4BMMIWs4lYuutNSKPL91kxhLydqC4YNxsQeoO5Jgdm9e/4wdsPtAzNSw5sHlbHETx626
         09Bpueva5+uNMa2c5cItvrt955BUdbFSYZWf6TcrfyCdAzPtOuZ4jkC8oShAzUDXxPju
         R+aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC5N4Y2dQpdcTtcl5IvNI5H26Fhjljotf5ChTXX2M9VG5tYtgMeRveHDP46xqmhQg83m1rLH3nI88Q29yP+ctgl/fYUKHWPjo5
X-Gm-Message-State: AOJu0Yw4U+MlWncPxMCJ1kCPNOw5aemSeILYF382Yft2vmQRf71uPwnB
	OeG7MLou7XFgQstV/pFwsaEyUbK1GdkyFxPzEclFckxuvRfpI9RP6d0jAQ==
X-Google-Smtp-Source: AGHT+IGv396+CncYFnfUSS5VWoxZgeb589E0kJDBd8htxnxW7t52MSU/TD7/Kpso6I3PgEtiimjnlA==
X-Received: by 2002:a05:6808:992:b0:3da:a5fa:9932 with SMTP id 5614622812f47-3daa5fa9d81mr6634646b6e.53.1720880912751;
        Sat, 13 Jul 2024 07:28:32 -0700 (PDT)
Received: from ?IPV6:2603:8080:2300:de:3d70:f8:6869:93de? ([2603:8080:2300:de:3d70:f8:6869:93de])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dab3e0fb26sm192958b6e.41.2024.07.13.07.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jul 2024 07:28:32 -0700 (PDT)
Message-ID: <70562aa0-a0bc-4a10-a2ef-6ba64245a752@gmail.com>
Date: Sat, 13 Jul 2024 09:28:31 -0500
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
To: Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20240712144903.392284-1-kuba@kernel.org>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20240712144903.392284-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/12/24 09:49, Jakub Kicinski wrote:

> Multiple vendors seem to prefer taking discussions off list, and
> ask contributors to work with them privately rather than just send
> patches to the list. I'd imagine this is because it's hard to fit in
> time for random developers popping up with features to review into
> packed schedule. From what I've seen "work in private" usually means
> someone on the company side will be assigned to handle the interaction,
> possibly months later. In worst case, the person scheduled to help
> the contributor takes over and writes the code themselves.
> This is not how the community is supposed to work.


So this is completely unenforceable, but as Mauro mentioned, it's an
opportunity to talk about this.
For starters, let's be clear about what the kernel community is actually
losing from closed-door discussions. E.g., if a company wants to fix their
driver, and an employee suggests approach A in an internal discussion, but
someone else prefers approach B, which is then shared publicly on the
mailing lists--is the real issue that the community did not get a chance to
learn about approach A? To discuss it, weigh the pros and cons, and share
opinions? If so, we should note that for published patches preceded by an
internal debate, it's encouraged to include some context in the cover
letters about why different approaches were _not_taken.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  .../maintainer/feature-and-driver-maintainers.rst     | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/maintainer/feature-and-driver-maintainers.rst b/Documentation/maintainer/feature-and-driver-maintainers.rst
> index f04cc183e1de..ac7798280201 100644
> --- a/Documentation/maintainer/feature-and-driver-maintainers.rst
> +++ b/Documentation/maintainer/feature-and-driver-maintainers.rst
> @@ -83,6 +83,17 @@ bugs as well, if the report is of reasonable quality or indicates a
>  problem that might be severe -- especially if they have *Supported*
>  status of the codebase in the MAINTAINERS file.
>  
> +Open development
> +----------------
> +
> +Discussions about user reported issues, and development of new code
> +should be conducted in a manner typical for the larger subsystem.
> +It is common for development within a single company to be conducted
> +behind closed doors. However, maintainers must not redirect discussions
> +and development related to the upstream code from the upstream mailing lists
> +to closed forums or private conversations. Reasonable exceptions to this
> +guidance include discussions about security related issues.
> +
>  Selecting the maintainer
>  ========================
>  


Thanks,

Carlos

