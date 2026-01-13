Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116D62D5432;
	Tue, 13 Jan 2026 10:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300578; cv=none; b=Vx7TGh8kCagz+XcHlHaVYYx96244NVPH7AGMP1yfV5Ie9HZh2ZIZXb3WrHwSqnLdkvP0KEmJ5Gc89IyWjyjli7R5ngl1TBbBSY8wVAUHcKC4E+MXxxkzoOAmqn86OFkl+XdlwpV8v1MIvYDZwUhXY+lmhO3lewIPtuWHzatA4jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300578; c=relaxed/simple;
	bh=mjf9liKdrS0BAzprnZGMPwy+V00In3pFEa7RQDiZRGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGeJrTOMKVk+sAkZIBHkqj5x37+7DPgafYR2sx3JFbdck28017+G1N8nyRvG+pohZ22jJS0nMI+mtsIA0yhTpQ/YxwNwzNLeE9ceQATSQKWgLu3wSkdqmKrX8jC5+IrgmryJtm/jyI+gwKu16SEGx9kF5Ykc8oh3IiY8aOi/ujU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFuZlLF5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFuZlLF5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC006C116C6;
	Tue, 13 Jan 2026 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768300577;
	bh=mjf9liKdrS0BAzprnZGMPwy+V00In3pFEa7RQDiZRGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFuZlLF5pSeMXk6xFbpkWiuDDsOMU2iChccatvlLSp8+YudrA0CRitTUqv7d8VnAb
	 P3+J1Lj/6FrmLmznJv8Bz11nmy5PlN3vhzVNu+l39d8KdagOwvgSs00IRWFGJodcZO
	 R4Ql7Ql14AxtWyprZlTE5luTdVruNSB/vdHtAQFhiGa8BunW2zBfi5kQTVks5C3epD
	 g5By64g4exoKLyFuVNSEqGK2A0WxGbsdT6yHOy6EG+atbCmfZE86vzJZpK32hwf8QC
	 zZtJawIWJDDENe+vtKUa9hhOk/bNVWBVO8q+4VtvSFwNsWxmZGXCmGtsMMfRcoXDcf
	 /1+qu4cDDqTig==
Date: Tue, 13 Jan 2026 10:36:09 +0000
From: Lee Jones <lee@kernel.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Simon Glass <simon.glass@canonical.com>,
	NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260113103609.GA1902656@google.com>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260113000612.1133427-1-dave.hansen@linux.intel.com>

On Mon, 12 Jan 2026, Dave Hansen wrote:

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
> disclose the tools they use to find issues by
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
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Reviewed-by: SeongJae Park <sj@kernel.org>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
> Reviewed-by: Simon Glass <simon.glass@canonical.com>

The premise of the document is good.  I offered a couple of suggestions;
however, even if they aren't accepted, the document LGTM.

Reviewed-by: Lee Jones <lee@kernel.org>

> Cc: NeilBrown <neilb@ownmail.net>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: workflows@vger.kernel.org
> Cc: ksummit@lists.linux.dev
> Link: https://lore.kernel.org/all/cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local/
> 
> --
> 
> Changes from v4:
>  * Modest tweaking and rewording to strengthen language
>  * Add a section to help alleviate concerns that the document would
>    not enable maintainers to act forcefully enough in the face of
>    high-volume low-quality contributions (aka. AI slop).
>    This is very close to some text that Lorenzo posted. I just
>    made some very minor wording tweaks and spelling fixes.
>  * Note: v4 mistakenly had "v3" in the subject
> 
> Changes from v3:
>  * Wording/formatting tweaks (Randy)
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
>  Documentation/process/generated-content.rst | 108 ++++++++++++++++++++
>  Documentation/process/index.rst             |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/process/generated-content.rst
> 
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
> +about the tool that you used.

Parsing ... okay, that took a few goes.  How about:

  Even if disclosure of your tool isn't mandated, providing this context
  often helps reviewers evaluate your contribution more effectively.
  Clear documentation of your workflow ensures a faster review with less
  contention.

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

Nit: Suggest removing the sporadic use of full-stops (periods) across all lists.

Or add them everywhere - so long as it's consistent.

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
>  
>  Dealing with bugs
>  -----------------
> -- 
> 2.34.1
> 
> 

-- 
Lee Jones [李琼斯]
