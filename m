Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887CF2F12A2;
	Fri, 14 Nov 2025 20:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763150911; cv=none; b=VqSWA9ZdCXMJQkiDUu1it+ohalNCYjBZcFZz19dQj9ZDgRgUwPPIt6i4ErpFQtfSmoSPymA5IlnLipt4C2Ms0mU2NkMLapZiper0X5LawnxXDqUheyuUeQYawCLZM9FJMymBmExfdSSz0h2z5z0h/l1b7Pw7mubVUG6MXVAKciQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763150911; c=relaxed/simple;
	bh=yh3F6VaWNtV+lDCG6BeoieqVByBx6oekLaKQo9C0zeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErxKv3bcVRcru6wfrIi+na73ui2RU7bVT5p7SzKZKOMn556wckkeV5u59GVUSHZ0qyf0pgtJRBzy2k4I7bTfW1DUqMaWYsixNMkMknc1aieVvvnPVBEyLNVjU3yPGvf8CF7M95LCql2zhIl14MoIcJZiFPqIxoNDrAogC5tC0OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QugZYcaC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QugZYcaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4191C4CEF5;
	Fri, 14 Nov 2025 20:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763150911;
	bh=yh3F6VaWNtV+lDCG6BeoieqVByBx6oekLaKQo9C0zeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QugZYcaCT6+tiR/amu/1Cv6HgkTxKP9y7UsTQsBzxcirhjMuGbRBMs/L23Lxe+DGM
	 WfpXD23FqCK+SQBaw0yRB8m9X6zEa3jxNCWjmOFJ1PSXv975wHqi2I329QhYirH+YC
	 Jk0WawPhJPW50e9ZMCT5zCqvy1WXmLaoIwgMx6UAREt2YXp6ugXIua5hCo6/lJgiE7
	 DsCOw/CcWtBFmzdOXo7K1/2NVwud5PnTm+9eclSpNFH834xZSMsHE7szzloTtQrxvk
	 38ksHBfXMg5MmEfqSv+7hrZX/QKe0z7acB3yQ+QROGspweDB4ryNI6iYkwzaiqE6ZC
	 7szKHKXcmCpRQ==
Date: Fri, 14 Nov 2025 12:08:29 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Takashi Iwai <tiwai@suse.de>
Cc: dave@sr71.net, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aReMPda2sowBpkO-@bombadil.infradead.org>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114183528.1239900-1-dave.hansen@linux.intel.com>

On Fri, Nov 14, 2025 at 10:35:28AM -0800, Dave Hansen wrote:
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

I really think we should just recommend the user to *consider* using:

Generated-by

I've been using it for Coccinelle on Linux for years, and it was not
just me. In other projects, in particular kdevops we started using this
to also be clear about the use of AI tools, and I've found it
instrumental to keep track of how much code *does not use it*.

> + - The input to the tools you used, like the Coccinelle source script.
> + - If code was largely generated from a single or short set of
> +   prompts, include those prompts.

A long time ago we evaluated the question of using git notes for
coccinelle used input, and the issue back then was we didn't have support
for it I think. But I think that hump is gone?

If so, would using git notes for prompts be useful in this case as we scale
tooling outside of Coccinelle, like AI prompts? I believe this can be
instrumental for enhancing LLMs as well for fine tuned LLMs for Linux
development.

Otherwise, looks good.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
