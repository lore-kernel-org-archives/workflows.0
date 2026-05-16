Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C30F23ABBF;
	Sat, 16 May 2026 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942390; cv=none; b=QF7QMm/oBQ8rfOACKanao/B0U59Af3Wnp9e7QPgSBf3vZcjdKrDElzBuyvOL6ZODeTBlxSArTfhxrcMI6ymNld/6cvwpZOwZjTtgkwj/w3o5DEm5+DXhttqJOgQHnAkxCwgnoMxTftqvKvyOiDp9WIq0e/0KqqRHlVjOq4dQFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942390; c=relaxed/simple;
	bh=YhUT7ANTCpHMuYpNDAb9UsiCiSOlxWGFhwf9FMJ4xtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvzMM6MTczaVv38eVohfxd/TG0Dn+N4mR0VkhzerEd1DvrPe7MLmnlm6xf3mlSycUsyoz2PKEa1uzOHpeGsNh1VHmN1kj5dkqzzLNIPvCQ/aAmhqyKjHb7IFe45UakzVNJ1l/N4RmIYlg+etrr6cvzO0htM1nqAeZNo9t+n4QPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2t9mlcl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2t9mlcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4350C19425;
	Sat, 16 May 2026 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778942389;
	bh=YhUT7ANTCpHMuYpNDAb9UsiCiSOlxWGFhwf9FMJ4xtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K2t9mlclC3xNCIaZ9muusrXhHN6ltCSE0ZWjHjK2sORx8ca2AvzxWCeMf/njbQHUx
	 i24P3TX4IEHDx83xUWRYkDk+4AGl9jSAZ1iLtVhMWJHL5W0xeWvKkJRo3r2gRAvBvG
	 ReDGxYYc8PSd5dHGAJV8fIzmj61SAHRmOJG5GHz1NQsMlKuF9NH/pJ+l7Bs4skyDtf
	 ZdD6UySL9Rr8Toh7H+LfHDE8hVHnFvWmeSr63paU5hjcn+4HSY/Xj3lRc6aE0x/d5K
	 XGjq8Cr3v4orRvdA414zodN3WXHHzylUoHUyhkATmlEpO9wghIZF59UhXfK+JTVzBV
	 DiajELMUiPHWg==
Message-ID: <ce1e5e9b-83d0-4971-aee3-dc5a8f85ce22@kernel.org>
Date: Sat, 16 May 2026 16:39:45 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: Clarify that in English
 "reviewer" is a person
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>
References: <20260516123846.63413-2-krzysztof.kozlowski@oss.qualcomm.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <20260516123846.63413-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/26 14:38, Krzysztof Kozlowski wrote:
> Common understanding of word "Reviewer" is: a person performing a review
> work [1]. Tools are not persons, thus cannot be reviewers in this term.
> Also tools cannot make statements ("A Reviewed-by tag is a statement of
> opinion"), since making a statement needs some sort of conscious mind.
> 
> Our docs already clearly mark that "Reviewed-by" must come from a
> person:
> 
>  - "By offering my Reviewed-by: tag, I state that:"
> 
>    Usage of first person "I" and word "state"
> 
>  - "A Reviewed-by tag is *a statement of opinion* that the patch is an
>     appropriate modification of the kernel without any remaining serious"
> 
>    Only a person can make a statement of opinion.
> 
>  - "Any interested reviewer (who has done the work) can offer a
>    Reviewed-by"
> 
>    A person can offer a tag thus above does not grant the tool
>    permission to offer a tag.
> 
> However this is not enough and apparently English is not that precise,
> so let's clarify that only a person can state the "Reviewer's statement
> of oversight".
> 
> Link: https://en.wiktionary.org/wiki/reviewer [1]
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I agree with the intent that the tag is for people (whether they use a tool
or not to help them). We also don't put "Tested-by: kernel test robot" or
syzkaller on every commit that they test and find no bugs. Review is also
not just about absence of bugs, but agreeing with the larger design and
whether the change makes sense to do in the first place.

So whether that's achieved with this particular wording or differently,

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> 
> ---
> 
> I find it silly to need to describe English, but it seems it is needed.
> 
> https://lore.kernel.org/all/fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net/
> ---
>  Documentation/process/submitting-patches.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index d7290e208e72..a989de43f3db 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -581,10 +581,10 @@ By offering my Reviewed-by: tag, I state that:
>  
>  A Reviewed-by tag is a statement of opinion that the patch is an
>  appropriate modification of the kernel without any remaining serious
> -technical issues.  Any interested reviewer (who has done the work) can
> -offer a Reviewed-by tag for a patch.  This tag serves to give credit to
> -reviewers and to inform maintainers of the degree of review which has been
> -done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
> +technical issues.  Any interested reviewer (who has done the work and is a
> +person) can offer a Reviewed-by tag for a patch.  This tag serves to give
> +credit to reviewers and to inform maintainers of the degree of review which has
> +been done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
>  understand the subject area and to perform thorough reviews, will normally
>  increase the likelihood of your patch getting into the kernel.
>  

