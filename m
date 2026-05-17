Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1587F236453;
	Sun, 17 May 2026 06:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778998410; cv=none; b=BxAtQmBHQe34Vxtl1bxvSoHH3ffyePOJCyrSf77xxsNlc1bdjNmMZkQxkBXPcDEcPjaYQ8eRZ26TGz4A5RerMQHmlUxipkkCnXrgJluej6QN19XjJwfwK+0LkCRHYswFy/FOOHeZFpCu/dYmxxvsqQb7pwQ07B7UALxMoCw3SrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778998410; c=relaxed/simple;
	bh=RqtsWVxjCmlUWBj5S7FO/i4j07nai2tv1fGyBa1ylnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDJNeb7/mQSy8BoDsgw2R9GvevRk1yuCyjdNwQiu+17jEBedEhzKqC4+qGVhSHLRd8sUBR8lWx+4TiLuN67PaHkhUzYVwP9lPiOFYfJLuePUtBkB7kz3pp2/BYQZwMClGuW7XAaNKrRpa/KHIT23Iw4MGfMs6wMeSnNa9VVbpmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2BzbujSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2BzbujSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B1DC2BCB0;
	Sun, 17 May 2026 06:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778998409;
	bh=RqtsWVxjCmlUWBj5S7FO/i4j07nai2tv1fGyBa1ylnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2BzbujSUdh0XGbpoxRA7VicXKQizqugRgZW3GWVAmwQJKDoAeWs/y46w+f1vlv0KK
	 d8sDoVGQrwVEE5ollOM7WJfzKQiLuFkWaFNZZIZcFsKBqKbyqLjutri9sUUYCSIGbu
	 pcrdhT/38mblks6LApWLKv4w8FCZ4wlm/dVqb+gA=
Date: Sun, 17 May 2026 08:13:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] docs: submitting-patches: Clarify that in English
 "reviewer" is a person
Message-ID: <2026051725-spoiler-nursing-0be5@gregkh>
References: <20260516123846.63413-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ce1e5e9b-83d0-4971-aee3-dc5a8f85ce22@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce1e5e9b-83d0-4971-aee3-dc5a8f85ce22@kernel.org>

On Sat, May 16, 2026 at 04:39:45PM +0200, Vlastimil Babka (SUSE) wrote:
> On 5/16/26 14:38, Krzysztof Kozlowski wrote:
> > Common understanding of word "Reviewer" is: a person performing a review
> > work [1]. Tools are not persons, thus cannot be reviewers in this term.
> > Also tools cannot make statements ("A Reviewed-by tag is a statement of
> > opinion"), since making a statement needs some sort of conscious mind.
> > 
> > Our docs already clearly mark that "Reviewed-by" must come from a
> > person:
> > 
> >  - "By offering my Reviewed-by: tag, I state that:"
> > 
> >    Usage of first person "I" and word "state"
> > 
> >  - "A Reviewed-by tag is *a statement of opinion* that the patch is an
> >     appropriate modification of the kernel without any remaining serious"
> > 
> >    Only a person can make a statement of opinion.
> > 
> >  - "Any interested reviewer (who has done the work) can offer a
> >    Reviewed-by"
> > 
> >    A person can offer a tag thus above does not grant the tool
> >    permission to offer a tag.
> > 
> > However this is not enough and apparently English is not that precise,
> > so let's clarify that only a person can state the "Reviewer's statement
> > of oversight".
> > 
> > Link: https://en.wiktionary.org/wiki/reviewer [1]
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Vlastimil Babka <vbabka@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> I agree with the intent that the tag is for people (whether they use a tool
> or not to help them). We also don't put "Tested-by: kernel test robot" or
> syzkaller on every commit that they test and find no bugs. Review is also
> not just about absence of bugs, but agreeing with the larger design and
> whether the change makes sense to do in the first place.
> 
> So whether that's achieved with this particular wording or differently,
> 
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
