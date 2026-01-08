Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441134CFB6
	for <workflows@vger.kernel.org>; Thu,  8 Jan 2026 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767884522; cv=none; b=SEDq9iDxloXP1jJCd1LrEFB3oOT+aWypg8TqgcHiTpDv5o+1U34LA6EaZNm4Kcd7mpFhQmZoO7v45Q7deE3QRhoIwxvZWKH3vY476c3YTgvdf/nbPcqh/1FkO6OzmsayJFlgxq2gWvna14A1Tchfitamcf21hNmEE/xpsI+NNRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767884522; c=relaxed/simple;
	bh=VUzvpOflNwjX8qoWsZCIAI7QfJt5lUXxCOmPmPt6i8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e953MsI3EDL/2WBf09ftYOM0udToh4JoL+I7CpYIhQhpgEgPXyrTy6XyIr+ReNJue1Z3/2rotUGCHndH1+KqeLGrSzmajq6qTUun/eXkDRh3T4PUHN2iS2JZ449u1R4x5+Elxl2iMRO89zq0+7LpfpihtcJ2IV2av8uEEJcbf74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JefayWJj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SK7LCF5l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JefayWJj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SK7LCF5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767884518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUCbWsJcBFgu60iEmXCpcPHQf+Gi4FoJmWQOv8WbAdM=;
	b=JefayWJjFwCO/vKrf1ocqcWAU+wPJVJ7l9FhHREAB2Y29r+2lWgN2x8CJy2B1LUIv+Z/hA
	S2OkY7Bq9zU4XXvbN0nJsJ9ZO7kiHR0UZJekmEvqpHMxPDUqYlCuZHQeMWpX28F4h1FJPa
	q/Mt/EuCILZpaLyv8qg1S6Ic1vNIiqk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-7tm0WgxDPFOAMr70XGDWNw-1; Thu, 08 Jan 2026 10:01:57 -0500
X-MC-Unique: 7tm0WgxDPFOAMr70XGDWNw-1
X-Mimecast-MFC-AGG-ID: 7tm0WgxDPFOAMr70XGDWNw_1767884516
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so31567885e9.0
        for <workflows@vger.kernel.org>; Thu, 08 Jan 2026 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767884516; x=1768489316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUCbWsJcBFgu60iEmXCpcPHQf+Gi4FoJmWQOv8WbAdM=;
        b=SK7LCF5lcriUYE1rL7VvkUqSq24rjHYeMlGYt+ptCQgmD5ruxxGcyJYXcK+D2hzTlR
         i1ph39pwIZHQg97ojNpxtKyBB2ijvLg4muzlQuiEIy1iqooFNn31on80p48luft1+g98
         u21rE4q7uWjrqn3NLSQA/UNBFo7SyISMqrSEt7JoG+0Us76rZ4rDep6hRO1ekya8xjwx
         6d9hzPQusQqAKAIBjemObYdqv+GGmYFM8N3BpO6AbS9cqqqkQLwt0itaZmyUuRKZc2lq
         tGqqjs3K6qrqg9IVgD7Op79/trgewlFD8hVfnjWj78JPvhDXXuxhtWKLVT78/P0yaO74
         NHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767884516; x=1768489316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUCbWsJcBFgu60iEmXCpcPHQf+Gi4FoJmWQOv8WbAdM=;
        b=gwwPITapAlflPLoIxj0ZRVRSxNH39YuEwF70ZakYe1dpa3gfrdRD/pJ4EXVAbHQ+OK
         wIxLsPTs1+ax+xa+0jq0gQxmUEdbk3l11uqw82KgW66lS6X73cnSJMjN1iyrKKh/ju73
         YAhhiI+dFmwPbhKt1Arua5SNDhOGELBriQeg3FxuC3QVqIc9LBXjjDTKikJ+dc0aeRqm
         Z87TixwM3Qe9HFfqJzZM6FMcVyOflvc8Jds1apGgoetMR59XEuLS4orpZK0pVnSRYy/D
         Y95UyExRsqDNBnYYXBDzwSMI8bzCkhtoXhNnCImeK+aE0WH3xDgMsnihC970S7CiKfTH
         yJcg==
X-Forwarded-Encrypted: i=1; AJvYcCVKxfpO2DKihFruiAayOOCSl7utiqwLhxXbT/Onr24AP9aca+b3BKyLLWo6xrSuUQ8ItNQS+HDhZ/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf6lAX3AhgDI8uFo+6h8JVCa4DBOJCLZrZzmaD7rDHPuy6yh2o
	rgDjtUfbZx5CbNAGK7D+0fwD4VcJfiXyxpvpVnUArEt0N8Rex06WTyAjkvNjBSf23DcslYF4aJh
	u6vpwQfxnHzgheLhDHQq4wl9RJOLeUvb2MhBfo96cESb9wAegw++wFDb9Za4mXA==
X-Gm-Gg: AY/fxX4FU2fPwCybNfHmZ0BYZxYe8giPyiiCf/RUFUg47t4X5RPCVKgVp/HN0D2AXoq
	mFNZYDqnUX4Ao/Ar90pR8U+ZWoGWYg/d1XYA6FD8FV+xfkN4TpVZP/dj6mFFQf9bb7QTfUt8cQc
	IfvD6I7Toax2dAbq3/5PfcWRt7kKM+skj1wa8ZZ9WgpLjyEmZpqFehr5un+F4l7z3npoZh4vf9H
	DmvvzMGAO7M3wI0ro/Ozk3Qf5KR8nnil2xooX30obnSUowJ8KO2U6VV4cxjSD7Tufn7MQmrmIcB
	bt/TgImtIuUo0k6JnDwgRVR/IVhzcRDp1NJIaL6lGcMYwbyy5snauCSZwIPiPszMM/Va9QGLZK5
	FsKVdSqpNwaRk3MshzQ/Y/60aGSS6j1CBdA==
X-Received: by 2002:a05:600c:820f:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-47d84b31525mr73188735e9.19.1767884516359;
        Thu, 08 Jan 2026 07:01:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVBpNsSpVO2K/vxy9aKs0+DGY42cpJHMoSK2T9UmlwTpmiJg1Qf8QGkotIb0+omrlpiL19Dg==
X-Received: by 2002:a05:600c:820f:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-47d84b31525mr73188285e9.19.1767884515874;
        Thu, 08 Jan 2026 07:01:55 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184e1sm154399065e9.4.2026.01.08.07.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:01:55 -0800 (PST)
Date: Thu, 8 Jan 2026 10:01:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260108095933-mutt-send-email-mst@kernel.org>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <20260108085215-mutt-send-email-mst@kernel.org>
 <6041b4b8-303a-f12b-24ea-92b836b7a025@inria.fr>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6041b4b8-303a-f12b-24ea-92b836b7a025@inria.fr>

On Thu, Jan 08, 2026 at 03:48:14PM +0100, Julia Lawall wrote:
> 
> 
> On Thu, 8 Jan 2026, Michael S. Tsirkin wrote:
> 
> > On Thu, Jan 08, 2026 at 08:17:09AM -0500, James Bottomley wrote:
> > > > +you are expected to understand and to be able to defend everything
> > > > you
> > > > +submit. If you are unable to do so, maintainers may choose to reject
> > > > your
> > > > +series outright.
> > >
> > > And I thing the addition would apply to any tool used to generate a
> > > patch set whether AI or not.
> >
> > Exactly. I saw my share of "fix checkpatch warning" slop. This is no
> > different.
> 
> I guess that most maintainers can easily recognize a patch that was
> motivated by checkpatch, Coccinelle, smatch etc.  Then the review can be
> informed by previous experience with the tool.  Will the same be the case
> for AI?  Or does it not matter?
> 
> julia

It is not the issue that checkpatch motivated something. The issue is
that a lot of people don't understand that "checkpatch complained" is
not motivation enough to make a change. I expect this holds for all
tools.

-- 
MST

