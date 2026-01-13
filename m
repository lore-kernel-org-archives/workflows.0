Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B00C36C0A6;
	Tue, 13 Jan 2026 19:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332133; cv=none; b=j4Oq1u/MMyc308Lq+CfHGINh5MdCy/60Efm9oZTw8ETnqpzkNBfq4FWgs/fx4810qwcScEaZTNSQX4adzsK2MmFwOW/zorUHXzpdKfDbykbure3aKRJ94yxEfVhgTecruuLOJYSCuqR4uERBpqnd8bA2iy/bqCi6fgbLqTZQrh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332133; c=relaxed/simple;
	bh=fliP3u1AyBaQEW8zTrzwBptj8SvPrltHjbIqzwRwQo8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bBAWE793qXjBosqoGIyUnQJNDdjgnsLUc8LhD/BK9BHe4088nteVl3uOiWQ/wQ/eBZ4L7wh7qh8N5/H85fUOj+leJAMvLv83LoZgKm9flHuDUHozpEIvRW+7M6KMBIHpFa1COOEwnKKB/LlPPOhp40cyetnwV0aX7MGjv2fJVFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Q9VH+1ob; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Q9VH+1ob"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0235E40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768332124; bh=hkrY2AHtEhWHIFzb7ipRx+NbI+67cl2riZoulH8Zh4M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Q9VH+1obGDExVRj9iX1SeIQmx3kLPJoUaGi6wooBhiaT5f+Bm8hZ1JRcTYI5yvcHx
	 E3kLjSKdKafoxlH1u1E0DO8CUMp4twjGYjR1XlEXCIn9uS5K2zNpNTya13/PYlCtXv
	 /YKAid7tOhRDYY/PbzkiXYLJKykI9xtVKxQ7ISKWA3jHHbGEjBvhYuonVvtZF59q7N
	 Kt8/zDDsZV+YK4mOrXh2BURoaKacs6v2HaSdyVL3hBsJ6vAbWwKXJ6+9ROHz1TFtXM
	 cYL8uWrbtEduANjz0YV8K1WYy8TAkBoqp/vU10xiu3nKJEeLoCNcyKHdXhd0ZhWl+b
	 PKqHe1mNfmiZA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0235E40C7C;
	Tue, 13 Jan 2026 19:22:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, Simon Glass
 <simon.glass@canonical.com>, NeilBrown <neilb@ownmail.net>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for
 tool-generated content
In-Reply-To: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
Date: Tue, 13 Jan 2026 12:22:03 -0700
Message-ID: <875x95xqqs.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dave Hansen <dave.hansen@linux.intel.com> writes:

> In the last few years, the capabilities of coding tools have exploded.
> As those capabilities have expanded, contributors and maintainers have
> more and more questions about how and when to apply those
> capabilities.
>
> Add new Documentation to guide contributors on how to best use kernel
> development tools, new and old.

So, in substance, this seems fine to me.

Naturally I have some nits I'll point out below.  But if you're tired of
this I'm happy to apply this version as well, let me know.

For the record, going forward, I'm likely to treat proposed changes to
this file the way I do coding-style.rst - I'll be highly reluctant to
apply them without a strong sense of community consensus behind them.

[...]

> diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
> new file mode 100644
> index 000000000000..867bf8894289
> --- /dev/null
> +++ b/Documentation/process/generated-content.rst
> @@ -0,0 +1,108 @@
> +============================================
> +Kernel Guidelines for Tool-Generated Content
> +============================================
> +
> +Purpose
> +=======
> +
> +Kernel contributors have been using tooling to generate contributions
> +for a long time. These tools can increase the volume of contributions.
> +At the same time, reviewer and maintainer bandwidth is a scarce
> +resource. Understanding which portions of a contribution come from
> +humans versus tools is helpful to maintain those resources and keep
> +kernel development healthy.
> +
> +The goal here is to clarify community expectations around tools. This
> +lets everyone become more productive while also maintaining high
> +degrees of trust between submitters and reviewers.
> +
> +Out of Scope
> +============
> +
> +These guidelines do not apply to tools that make trivial tweaks to
> +preexisting content. Nor do they pertain to AI tooling that helps with

It seems you have gone out of your way to avoid using "AI" and refer to
"tooling" in general, so it's a bit strange to see that term here,
especially at the head of a list of mostly non-AI tasks.

> +menial tasks. Some examples:
> +
> + - Spelling and grammar fix ups, like rephrasing to imperative voice
> + - Typing aids like identifier completion, common boilerplate or
> +   trivial pattern completion
> + - Purely mechanical transformations like variable renaming
> + - Reformatting, like running Lindent, ``clang-format`` or
> +   ``rust-fmt``
> +
> +Even if your tool use is out of scope, you should still always consider
> +if it would help reviewing your contribution if the reviewer knows

s/if/whether/

> +about the tool that you used.
> +
> +In Scope
> +========
> +
> +These guidelines apply when a meaningful amount of content in a kernel
> +contribution was not written by a person in the Signed-off-by chain,
> +but was instead created by a tool.
> +
> +Detection of a problem and testing the fix for it is also part of the
> +development process; if a tool was used to find a problem addressed by
> +a change, that should be noted in the changelog. This not only gives
> +credit where it is due, it also helps fellow developers find out about
> +these tools.
> +
> +Some examples:
> + - Any tool-suggested fix such as ``checkpatch.pl --fix``
> + - Coccinelle scripts
> + - A chatbot generated a new function in your patch to sort list entries.
> + - A .c file in the patch was originally generated by a coding
> +   assistant but cleaned up by hand.
> + - The changelog was generated by handing the patch to a generative AI
> +   tool and asking it to write the changelog.
> + - The changelog was translated from another language.
> +
> +If in doubt, choose transparency and assume these guidelines apply to
> +your contribution.
> +
> +Guidelines
> +==========
> +
> +First, read the Developer's Certificate of Origin:
> +Documentation/process/submitting-patches.rst. Its rules are simple
> +and have been in place for a long time. They have covered many
> +tool-generated contributions. Ensure that you understand your entire
> +submission and are prepared to respond to review comments.
> +
> +Second, when making a contribution, be transparent about the origin of
> +content in cover letters and changelogs. You can be more transparent
> +by adding information like this:
> +
> + - What tools were used?
> + - The input to the tools you used, like the Coccinelle source script.
> + - If code was largely generated from a single or short set of
> +   prompts, include those prompts. For longer sessions, include a
> +   summary of the prompts and the nature of resulting assistance.
> + - Which portions of the content were affected by that tool?
> + - How is the submission tested and what tools were used to test the
> +   fix?
> +
> +As with all contributions, individual maintainers have discretion to
> +choose how they handle the contribution. For example, they might:
> +
> + - Treat it just like any other contribution.
> + - Reject it outright.
> + - Treat the contribution specially like reviewing with extra scrutiny,

s/ like/, for example,/

> +   or at a lower priority than human-generated content.
> + - Suggest a better prompt instead of suggesting specific code changes.
> + - Ask for some other special steps, like asking the contributor to
> +   elaborate on how the tool or model was trained.
> + - Ask the submitter to explain in more detail about the contribution
> +   so that the maintainer can be assured that the submitter fully
> +   understands how the code works.
> +
> +If tools permit you to generate a contribution automatically, expect
> +additional scrutiny in proportion to how much of it was generated.
> +
> +As with the output of any tooling, the result may be incorrect or
> +inappropriate. You are expected to understand and to be able to defend
> +everything you submit. If you are unable to do so, then do not submit
> +the resulting changes.
> +
> +If you do so anyway, maintainers are entitled to reject your series
> +without detailed review.
> diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
> index aa12f2660194..e1a8a31389f5 100644
> --- a/Documentation/process/index.rst
> +++ b/Documentation/process/index.rst
> @@ -68,6 +68,7 @@ beyond).
>     stable-kernel-rules
>     management-style
>     researcher-guidelines
> +   generated-content

At some point, $SOMEBODY should probably add a brief reference to
submitting-patches.rst as well.

Thanks,

jon
