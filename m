Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005B824501D
	for <workflows@vger.kernel.org>; Mon,  4 Aug 2025 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754299405; cv=none; b=Zo3KGLsDM8Zz8w/ZsL4m3ycRNek13BeO/uiy9CfbGDaD0QXuZfhJe5p+zWsZtZTHIMsIw6soTymzaQjAQBfL+IBdCtszGqwILCqQh7OVPRajoNfWaZIP92oU6+gqCuzyCW7Wo4hyE/igjNnuA3o3fy49Pd8mWCf/TfwnJvkm/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754299405; c=relaxed/simple;
	bh=bl4pvcQ7PmhJNds/3JVxi4Rb+Sc6+NTkcOubu84sWgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrxkeYAoHbEKt2Jj2BVNRiIXqgEKqkc99BZhM9vcNiqxaECzxcHreVmCIRjPwuiih6fLrf0ijPlmPlHKP90uHDyqS//wTIPjdj8Fv2Fpg+zlqHrJRjheM/Wq+GSeP24ErASWX5NFgc8DiCr/5HWtZevYH/j6eF2kexjer7kiePo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fgwxBoeF; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fgwxBoeF"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so22243205e9.2
        for <workflows@vger.kernel.org>; Mon, 04 Aug 2025 02:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754299402; x=1754904202; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AIvooEURLKmBQsBvckse7hDqJtnWUv025cagmh0D7jI=;
        b=fgwxBoeFGUmW26aiIV4h+ZCJgXkdhWSs0qAPJjnqZx9UnMhJQZwiE3lFiSagO/Ss7u
         I6TSBADKo4RufTfr9vp/8X3GisybYy9UeF1A88H+/HpMA2PYv42XDTMDJ+YP2B7EtJXz
         IcHK/qU90Qt2s8Z6LcdRnXSwxlEFJGJozY5WnQqPWBs/zdtY0BCNkH7LHlHs/Z1NuCe1
         1+mELm5fXcL2K+F36Tcv9Xe+O8ZtYd5TRBKy74c1xD9SYzfdTJq+S1A0H7jHqPIpIURV
         Ypve1hXwnXUHAOBGzcsEqWBa4z0qu7qifNWbQ/CSu873oYhqaKgvw0oaAuIwFzLC3tgW
         NQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754299402; x=1754904202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIvooEURLKmBQsBvckse7hDqJtnWUv025cagmh0D7jI=;
        b=frTyyZEx7uB2r/Gwb3P+/Vn+xPVnrtalZ8ZGc3gmhDWIGZ2FOKpso+JO9RHzln0P00
         pHgRS+H4d0LuDe7mV2tcfkwFNjAdf7gUN9wcMlt8MAN86VFDvsfXCjuxlSrlEWC0rWL+
         vPeCSnrkIoesF/F9UDPBZ/zcnZuAFlcYJEoKQXSiU9961bJTgQI5uICjPZwXvHX7UGC/
         WRCsfBjpr/SDp9L6nPTA+H9SYA82GiKAkTjydeQ5JbjSDDy4rj6r32l0I+WVZZn0MEGC
         gdsUTj9+NojhbIxhJXZ4jFrNQ8+VD6emNU5GUAwp7Bia3rfIfyjXOfmC8z0c4n4Le8+g
         f/Og==
X-Forwarded-Encrypted: i=1; AJvYcCVDMxy8dU452uGz970qquHgPLXQ9bo2TpwR5nPV7+SCembQ3YhkCIlndabiPlmtEUDeaxy9biRmoHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiOocqmw3w2IO8uW4VlfE+QfHpV3kh3h8nC1FiNvrlB0Jo95wY
	v8lnd3RBo6GxjzYYH3vXRwQjFxQhPVBQ3yIeCeTJGPkqMAtaZ1dev0hAZvIi5yG3miBiqFVBA1N
	WkXEakJfQ5g==
X-Gm-Gg: ASbGncvVP7dpSaAXAep3qBltIihrwhPy8kjaPJNJLGpun96qaFLpyseIEs7M36k1VxV
	fr0qGdrwsN0FXvwbqXtGuOvXhDEaJoub8Z9an3pGuhKATWA4XQZtbVNQrXzaTR6pet1uNMskElR
	w5LmKVrKafHih+2sgGajpc4fzTYDUnlgjY+HOIvdnMn8NYsoDVXxGjcTfJQbtAPpLD9udJKYq0d
	K6r8ytL5tP5tJkQoKVDQFTzWqLvCTjxfMtR6smdgtFd0LkpCU3hvfU94JV9Phv9lV3gnVnit7/a
	dMpkHQYkT5pPRpFC57MlzO9aBz0shvfqCOjfr8pFeq+qX6APlrOpq8JOORNEIMxBa7jSgK3Byca
	TllLqdIEXdGpDYUR8uxcI6eSdrhcw4Jc+Zj8UsEQrYkOF1wfZwfUVevXuCDwz2mTQKwf9KzelSW
	MPYe6mKjXBn3Kguh1lmLyt
X-Google-Smtp-Source: AGHT+IEasBox7LzLdn9lD/i3sfDKKBoMxY+rEAlISaXJV7oTeph6/hbIU7OkooVpBnih8ZL0dl9DAA==
X-Received: by 2002:a05:600c:3b9a:b0:459:443e:b177 with SMTP id 5b1f17b1804b1-459443eb2bcmr28240165e9.25.1754299402352;
        Mon, 04 Aug 2025 02:23:22 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8394-58e6-9e1a-64e5-71bf-cbcb.ipv6.o2.cz. [2a00:1028:8394:58e6:9e1a:64e5:71bf:cbcb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b8e054036bsm5016796f8f.31.2025.08.04.02.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:23:22 -0700 (PDT)
Date: Mon, 4 Aug 2025 11:23:21 +0200
From: Michal Hocko <mhocko@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: David Hildenbrand <david@redhat.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, corbet@lwn.net,
	linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	josh@joshtriplett.org, kees@kernel.org,
	konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rostedt@goodmis.org
Subject: Re: [PATCH 0/4] Add agent coding assistant configuration to Linux
 kernel
Message-ID: <aJB8CdXqCEuitnQj@tiehlicka>
References: <20250727195802.2222764-1-sashal@kernel.org>
 <75d86e96-cb18-4996-998c-da7ac0e97468@suse.cz>
 <9afd157a-296d-4f4d-9d65-07b89ab3906f@redhat.com>
 <2025072832-enrich-pampers-54b9@gregkh>
 <1bd04ce1-87c0-4e23-b155-84f7235f6072@redhat.com>
 <aId1oZn_KFaa0R_Q@lappy>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aId1oZn_KFaa0R_Q@lappy>

On Mon 28-07-25 09:05:37, Sasha Levin wrote:
> On Mon, Jul 28, 2025 at 12:47:55PM +0200, David Hildenbrand wrote:
> > We cannot keep complaining about maintainer overload and, at the same
> > time, encourage people to bombard us with even more of that stuff.
> > 
> > Clearly flagging stuff as AI-generated can maybe help. But really, what
> > we need is a proper AI policy. I think QEMU did a good job (again, maybe
> > too strict, not sure).
> 
> So I've sent this series because I thought it's a parallel effort to the
> effort of creating an "AI Policy".
> 
> Right now we already (implicitly) have a policy as far as these
> contributions go, based on
> https://www.linuxfoundation.org/legal/generative-ai and the lack of
> other guidelines in our codebase, we effectively welcome AI generated
> contributions without any other requirements beyond the ones that affect
> a regular human.
> 
> This series of patches attempts to clarify that point to AI: it has to
> follow the same requirements and rules that humans do.

The above guidance is quite vague. How me as a maintainer should know
that whatever AI tool has been used is meeting those two conditions

: 1. Contributors should ensure that the terms and conditions of the
: generative AI tool do not place any contractual restrictions on how the
: tool’s output can be used that are inconsistent with the project’s open
: source software license, the project’s intellectual property policies,
: or the Open Source Definition. 
: 
: 2. If any pre-existing copyrighted materials (including pre-existing
: open source code) authored or owned by third parties are included in the
: AI tool’s output, prior to contributing such output to the project, the
: Contributor should confirm that they have have permission from the third
: party owners–such as the form of an open source license or public domain
: declaration that complies with the project’s licensing policies–to use
: and modify such pre-existing materials and contribute them to the
: project. Additionally, the contributor should provide notice and
: attribution of such third party rights, along with information about the
: applicable license terms, with their contribution.

Is that my responsibility?
-- 
Michal Hocko
SUSE Labs
