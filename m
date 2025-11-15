Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05C1FF5F9;
	Sat, 15 Nov 2025 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763237432; cv=none; b=sBdkYQCl3W2fKrbA9J4oFW3F1y+lR6h9bZyR5NHPDT+MooIqAjBEZ8PpUpfs85pF0VAlNYgIDkg3mKPqkW0F44NbMwL3t6tmvyUlgnedJ8OIiEpUpg/7kc83Ceja019AaA21mAxLxtSmRYnld13WfcfDXU0id6vvHjVZez+DFmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763237432; c=relaxed/simple;
	bh=mSUq+JdMleQNFke5u/cwigswD2e1dEnxc4QB1RTihrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JcmLzB5XKyNRAw6Sl6MP0ed9xBETKvhci6u722I1k1KiYaQ2lyWRBVcAA3fkq0TdrBwDeUP1PnZHNG987dvL1DEtVZ/qGt1NDp9kvM4vbOG3ZfxzY22YbVz7nAOnR9cS2IzY0oGUV4LuQT+lDjA2NKdGwniDs07S9OULKFaQids=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vqKv2y+J; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vqKv2y+J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tMP3loD4ip9eRcdMFRm30AGFl0GGDYG44l8JjblsTS8=; b=vqKv2y+JKg+mfn+OegWURX36TQ
	2alFcsZtbiCq9h55B0Jg34f3k0bFWkppe2YGbmWJsM+OMaZFVF6cj49KyNIE8/NKTqmKcvTUIWIYz
	puUUDeS0qXmweoPp6qXxWuh4Dj1FVzclj+tn5zXaEZXmgoaQmjXF6GusEQH6Nich7OFjN2eqZ4hDm
	RY7yFIduId6GFmjlYRC/mjfNHL8R25NGTgbfuAvdsxVkDlv0H3UFOzUnbMpVTVnrMcBaOwYds3W5g
	9B7SYu1COk3qhmMNiR5czkdFblJnnykGQ75PBzNdEZToqUG28hUggve/V9+azKt2rJ/ipF/zKvkyT
	weY1sUyQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMbH-0000000E3Vt-0fHq;
	Sat, 15 Nov 2025 20:10:23 +0000
Message-ID: <310aab19-778b-4f68-ae85-c613dd45b556@infradead.org>
Date: Sat, 15 Nov 2025 12:10:22 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated
 content
To: Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net
Cc: Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
 ksummit@lists.linux.dev
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/14/25 10:35 AM, Dave Hansen wrote:
> In the last few years, the capabilities of coding tools have exploded.
> As those capabilities have expanded, contributors and maintainers have
> more and more questions about how and when to apply those
> capabilities.
> 
> Add new Documentation to guide contributors on how to best use kernel
> development tools, new and old.
> 
> Note, though, there are fundamentally no new or unique rules in this
> new document. It clarifies expectations that the kernel community has
> had for many years. For example, researchers are already asked to
> disclose the tools they use to find issues in

"in" is ambiguous here. s/in/by/ or move the "in..." phrase to just
after "are already asked." Or maybe it doesn't matter in the commit
message. :)

> Documentation/process/researcher-guidelines.rst. This new document
> just reiterates existing best practices for development tooling.
> 
> In short: Please show your work and make sure your contribution is
> easy to review.
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Shuah Khan <shuah@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Cc: NeilBrown <neilb@ownmail.net>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: workflows@vger.kernel.org
> Cc: ksummit@lists.linux.dev
> 
> --
> 
> There has been a ton of feedback since v2. Thanks everyone! I've
> tried to respect all of the feedback, but some of it has been
> contradictory and I haven't been able to incorporate everything.
> 
> Please speak up if I missed something important here.
> 
> Changes from v2:
>  * Mention testing (Shuah)
>  * Remove "very", rename LLM => coding assistant (Dan)
>  * More formatting sprucing up and minor typos (Miguel)
>  * Make changelog and text less flashy (Christian)
>  * Tone down critical=>helpful (Neil)
> 
> Changes from v1:
>  * Rename to generated-content.rst and add to documentation index.
>    (Jon)
>  * Rework subject to align with the new filename
>  * Replace commercial names with generic ones. (Jon)
>  * Be consistent about punctuation at the end of bullets for whole
>    sentences. (Miguel)
>  * Formatting sprucing up and minor typos (Miguel)
> 
> This document was a collaborative effort from all the members of
> the TAB. I just reformatted it into .rst and wrote the changelog.
> ---
>  Documentation/process/generated-content.rst | 96 +++++++++++++++++++++
>  Documentation/process/index.rst             |  1 +
>  2 files changed, 97 insertions(+)
>  create mode 100644 Documentation/process/generated-content.rst
> 
> diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
> new file mode 100644
> index 0000000000000..acdf23819d685
> --- /dev/null
> +++ b/Documentation/process/generated-content.rst
> @@ -0,0 +1,96 @@
> +============================================
> +Kernel Guidelines for Tool Generated Content

                         Tool-Generated

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
> +menial tasks. Some examples:
> +
> + - Spelling and grammar fix ups, like rephrasing to imperative voice
> + - Typing aids like identifier completion, common boilerplate or
> +   trivial pattern completion
> + - Purely mechanical transformations like variable renaming
> + - Reformatting, like running Lindent, ``clang-format`` or
> +   ``rust-fmt``
> +
> +Even if your tool use is out of scope you should still always consider

                          maybe:   scope,

> +if it would help reviewing your contribution if the reviewer knows
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
> + - How is the submission tested and tools used to test the fix?

                                   and what tools were used to test the fix?

> +
> +As with all contributions, individual maintainers have discretion to
> +choose how they handle the contribution. For example, they might:
> +
> + - Treat it just like any other contribution.
> + - Reject it outright.
> + - Treat the contribution specially like reviewing with extra scrutiny,
> +   or at a lower priority than human-generated content
> + - Suggest a better prompt instead of suggesting specific code changes.
> + - Ask for some other special steps, like asking the contributor to
> +   elaborate on how the tool or model was trained.
> + - Ask the submitter to explain in more detail about the contribution
> +   so that the maintainer can feel comfortable that the submitter fully
> +   understands how the code works.

thanks.
-- 
~Randy

