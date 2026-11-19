Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097275;
	b=pRd8l8XeH6oHj3Be6jDLWtvhEceqswEK+fzjCxJ7dqDI3/qhs5jJ3B7exLNMi8AZSO9H
	 bEzI7OSm1fKMzI65DBJyE9kwHrrghUXcvC6zkHLX3AN5zP1jyR1rg6vrKtwza0PCSyQgg
	 Kd0bzS9H3xGGpuZaHAW+wHo6X4+1zNWvyKHeo6EJLCTw8WEF7V8NuzfwHzYsyETJzA8zz
	 Z6nOjfcUS35a1660TVrRmiPElcsGagI2FLrxIQGTLSkRapKyVDkaRytSkYPFGukprDY8f
	 dYQPQnvqD7ZhWJFRYKVbn1N4X6lbPi0C7aTuCZF4rQAH98DKsULqaG2axDNdcNx57Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097275;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h4WEBZt8zvJPkIGFlDBBDtrAGaCS/Hic2L8pvEkBCJM=;
	b=RAmaa64AdlrCPIYsCOljjgv69uquerAJGpio/5edtijIm7XGzftvqINhXjC6K3E9E4XF
	 ayUxVdLZp5YSRJ5d0IYTI3NNSYOJ0k4tME/ljL38E+AoWlzUnzhEXJ1kGdCD9R0mahUy2
	 ioKa7mYaR+3W5m8vj/rDTyKx2xUacWW7OpNE+6y9RISmLJO2rup95YFW0tWv7JYIVMb9X
	 /uhQalk1MYgPWzhnPxVJppVbvMAImXEwUpyDNnQXOI1pofUrNidlWHmMym57FBA/6MiX7
	 iye7De3/h/d9FELAmaE8eSrRpoba3JnVKg2Vqww9h/Mjp85LGz5jZ0frb283Sbw4kkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BR6MmYw3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAC8606A325;
	Thu, 19 Nov 2026 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BR6MmYw3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763A01F000C5;
	Thu, 19 Nov 2026 14:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097275;
	bh=h4WEBZt8zvJPkIGFlDBBDtrAGaCS/Hic2L8pvEkBCJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BR6MmYw31vFoQaf3bfXZOOR30u8VFq0hzmApgVeCIYowgJyGnA33pKhkgxf5XQDxf
	 4Mus+YH/JRjlIFqE2l7OAj4G7BtMaj9H0ltUjsoH69zjV3dgq525Q90Dr2/PiUUaHP
	 a3xHM1UNsizW7OJ+W1HomsIdgudbncYBw/ZrRc+HSx4qYmLkPhZ7kRsGMgTUixwcWb
	 MBWQfgA2H1WHh2ZAzUODQ8OlQGatDt1dizgr8Z9TfFdPf5JUu5RiFuQY94IbHqOdMc
	 9dnuiNQa3ldR3I9Gsr2Qh9zMcFxHIKxocOQUGw3nxcqI1pblbyvAOtpgBUJhnjL+jc
	 GakSfd0MetoHQ==
Date: Thu, 19 Nov 2026 16:07:50 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261119140750.GL162713@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
 <20261119111902.GH162713@unreal>
 <04ff90ba-296a-4618-9d25-390f84f856ae@kernel.org>
 <av7tY64O34gbJvH_@1wt.eu>
 <20261119125450.GJ162713@unreal>
 <6baae2d0-f0d5-4528-b885-220605350349@kernel.org>
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
In-Reply-To: <6baae2d0-f0d5-4528-b885-220605350349@kernel.org>

On Thu, Nov 19, 2026 at 02:16:30PM +0100, Krzysztof Kozlowski wrote:
> On 19/11/2026 13:54, Leon Romanovsky wrote:
> > On Thu, Nov 19, 2026 at 01:36:51PM +0100, Willy Tarreau wrote:
> >> On Thu, Nov 19, 2026 at 01:04:32PM +0100, Krzysztof Kozlowski wrote:
> >>> On 19/11/2026 12:19, Leon Romanovsky wrote:
> >>>> On Thu, Nov 19, 2026 at 11:13:57AM +0100, Krzysztof Kozlowski wrote:
> >>>>>>> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
> >>>>>>>
> >>>>>>>  Documentation/process/coding-assistants.rst  |  6 +++--
> >>>>>>>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
> >>>>>>>  2 files changed, 27 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> Sasha,
> >>>>>>
> >>>>>> Since you're already making changes in that area, could you add a sentence
> >>>>>> asking reporters to provide the full dmesg stack trace?
> >>>>>
> >>>>> If so, then trimmed. We do not need all addresses and registers and the
> >>>>> [time markers], but rather the calltrace from decode_stacktrace.sh.
> >>>>
> >>>> Regarding time markers, I agree. However, addresses are an important part of
> >>>> debugging information. These bugs are rare, but addresses are still useful for
> >>>> identifying incorrect pointer arithmetic or pointer assignments.
> >>>
> >>> Depending on the case, e.g. some driver lockdep reports don't need them.
> >>> NULL ptr usually as well. The point is that dmesg should be trimmed to
> >>> relevant and useful information. If that includes addresses for that
> >>> particular case, then of course these should stay. But 75% of data here
> >>> in commit like 5b4bd13e0552926648a46c2c9a12a24dfaee3715 is not really
> >>> helping. In the same time undecoded call trace is useless, because these
> >>> addresses depends on the build. The dmesg should simply be the decoded
> >>> stacktrace ONLY for this case.
> >>
> >> Then just the 2-3 lines capture inline, and the full log attached could
> >> please everyone ?
> > 
> > I don't think so, because this information is also important to preserve in the
> > Git history. I received offline feedback that the full stack is useful for
> > backporting and customer support, too. Sometimes the dmesg output is similar
> 
> Just like we do not mark commits as fixing CVEs/security issues, which
> plenty of downstream distros would like us to do, we do not write commit
> msgs for backporting or customer support. Just look at that commit I
> pointed out - 5b4bd13e0552926648a46c2c9a12a24dfaee3715 - the addresses
> are making things less readable and the readability is important.

I looked, but nothing stood out as distracting. I've been reading these
stacks for nearly 20 years.

> 
> If you need something for customers, then that is what Link tag is for.
> It can point to your bugzilla or email report with everything.

You missed my point, I'm not asking customers to dig into the kernel. An FAE
or customer comes to me with a crash, and I need to determine whether it's
a known issue (and point them to the relevant patch) or a different one.

Thanks

> 
> 
> 
> Best regards,
> Krzysztof
> 
