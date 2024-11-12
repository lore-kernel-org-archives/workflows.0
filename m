Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050F6219C82
	for <workflows@vger.kernel.org>; Tue, 12 Nov 2024 19:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731439290; cv=none; b=HjUi7mH51wVCoZm/hw9KUnqZQ42+rjBpNI/I3JZ53Blq9+9TVXRQUwxNiHlLut0YGxL9wvUEATdjH49TtBbGSuqMI73EfcKhNqhK5Mh+yxEemfs1CgPR65xf3g1qWt832qhtJY03mhDQ6p5FTSU77QVzoXw82/rMML5ZRbzOOFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731439290; c=relaxed/simple;
	bh=yE45QrhNWmhn/fkyErZOdv2B/yQ4TBW/IkZmciYJkDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwByuLCPog/o1ntHEQdONRgaJH+pYU/vl7LVbL0oXptJRoNy0jAAsDPCI2jIx9MO2yfejpv9cQg1/Rc/EiSxbKBLbPLMknOgEgiqAVYmpMG+fgavmVXQCK+K/vfFpmZ1sbBISB96NWLFYmT9nZKHJIYUck7lvw/ds4wVqgPsVOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=kOFYZ3Iu; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kOFYZ3Iu"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e602a73ba1so3613727b6e.2
        for <workflows@vger.kernel.org>; Tue, 12 Nov 2024 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1731439286; x=1732044086; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KdLsB2RmvIaNhuM2RQrjIGniDaG3gtn+FYYbXQwyLjQ=;
        b=kOFYZ3IulBK375eW1ZuKRiveMYUhhQl9BaF+/Nrtw+5aD55ITnD6jWAmTlhkd3pwrs
         XChBnwST1bZIww6fVKbvxif/jAqRnMNN0Eo3DEGg4nMcTr2e0zPEV6GLpfAFaP97Qnbl
         MaCfjPyQc/kB0ypdJHateZ9Cn0YVwUct0QdZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439286; x=1732044086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdLsB2RmvIaNhuM2RQrjIGniDaG3gtn+FYYbXQwyLjQ=;
        b=V6wIj3tutgs9PqMW3RU69Jpwnxh34NDCepxtGboxyWfIe5JKrpaWnMQuDuLQmARbh0
         i7VdhOqApN9c+2D+PhyE5bxnFGLG7gcvZvAB0lDkosxgJT2nNP4jvJT9/t6XJIAh5PBb
         KUgsr1cjiB6cSe3Yiw7rvwN9xaAWw0zZ4SNeGt3ejTR5WMTLW6r0igBAFS8eFzk+i3vt
         Xc4UbVTgxWbet7/udM3xYn3o4vGYC7Xi9Z16jPH5/7jnsQD1gamft9m6CoVFvZLi7vA5
         V2zlK+oqupnC+hTPICIhT4ZWsWZnpzkrxXiai+cX6gZ+2tvpdV6fVx93JPMktyaIXzYf
         VWwA==
X-Forwarded-Encrypted: i=1; AJvYcCXc+QpijH2lZzEHsX10g42Gv8z3DlHRS6pfiWFV/uevdkVjLCo9ywoarAUS2BfHXjkksaNBiPTODDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOXEbbeTozj1JMb27K7QsvMDj/Uxik68DaL/QYdriZGyLu+PMq
	zMcKIrYeOrMX7scG8+Cp0XnFzR1E9mcDbXbOHEyIwCGlrnL2shXITlZ2evNznt8b8Uv7IVieo7d
	4gCPiFoo+YBMk/CtHgUqRaIndBIVUzaSsCY037Q==
X-Google-Smtp-Source: AGHT+IG8MZOfUN1iQ3EJafqKXedS2lIEywdwom52FQH7gICN9ovIXOS7HUYpRMgTzYVe1l/BK5FWaXivkAr8ZVcdAbg=
X-Received: by 2002:a05:6808:1302:b0:3e0:7441:e487 with SMTP id
 5614622812f47-3e7b0ad78b4mr98755b6e.37.1731439285895; Tue, 12 Nov 2024
 11:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111163723.9002-1-skhan@linuxfoundation.org>
In-Reply-To: <20241111163723.9002-1-skhan@linuxfoundation.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 12 Nov 2024 20:21:15 +0100
Message-ID: <CAKMK7uGS3FJVp690She5d+XbQV5x7yQFPozta4cfnzga-BYAOQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Dan Williams <dan.j.williams@intel.com>, 
	"Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Nov 2024 at 17:39, Shuah Khan <skhan@linuxfoundation.org> wrote:
> The Code of Conduct committee's goal first and foremost is to bring about
> change to ensure our community continues to foster respectful discussions.
>
> In the interest of transparency, the CoC enforcement policy is formalized
> for unacceptable behaviors.
>
> Update the Code of Conduct Interpretation document with the enforcement
> information.
>
> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Jonathan Corbet <corbet@lwn.net>
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Theodore Ts'o <tytso@mit.edu>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>
> Changes since v1:
> - Updates Acks with Ted's ack.
> - Fixes subsection formatting as per Randy's suggestion.
> - Fixes a spelling error.
>
>  .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
> index 66b07f14714c..ebddf218341d 100644
> --- a/Documentation/process/code-of-conduct-interpretation.rst
> +++ b/Documentation/process/code-of-conduct-interpretation.rst
> @@ -156,3 +156,55 @@ overridden decisions including complete and identifiable voting details.
>  Because how we interpret and enforce the Code of Conduct will evolve over
>  time, this document will be updated when necessary to reflect any
>  changes.
> +
> +Enforcement for Unacceptable Behavior Code of Conduct Violations
> +----------------------------------------------------------------
> +
> +The Code of Conduct committee works to ensure that our community continues
> +to be inclusive and fosters diverse discussions and viewpoints, and works
> +to improve those characteristics over time. The Code of Conduct committee
> +takes measures to restore productive and respectful collaboration when an
> +unacceptable behavior has negatively impacted that relationship.
> +
> +Seek public apology for the violation
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The Code of Conduct Committee publicly calls out the behavior in the
> +setting in which the violation has taken place, seeking public apology
> +for the violation.
> +
> +A public apology for the violation is the first step towards rebuilding
> +the trust. Trust is essential for the continued success and health of the
> +community which operates on trust and respect.
> +
> +Remedial measures if there is no public apology for the violation
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The Code of Conduct Committee determines the next course of action
> +to restore the healthy collaboration by recommending remedial measure(s)
> +to the TAB for approval.
> +
> +- Ban violator from participating in the kernel development process for
> +  a period of up to a full kernel development cycle. The Code of Conduct
> +  Committee could require public apology as a condition for lifting the
> +  ban.
> +
> +The scope of the ban for a period of time could include:
> +
> +    a. denying patch contributions and pull requests
> +    b. pausing collaboration with the violator by ignoring their
> +       contributions and/or blocking their email account(s)
> +    c. blocking their access to kernel.org accounts and mailing lists
> +
> +Once the TAB approves one or more of the measures outlined in the scope of
> +the ban by a two-thirds vote, the Code of Conduct Committee will enforce
> +the TAB approved measure(s) in collaboration with the community, maintainers,
> +sub-maintainers, and kernel.org administrators.

This is a detail I missed at first, but I think it's a very important
one and needs to be highlighted.

Years ago when the kernel CoC was put in plae, there was a very long
discussion around whether maintainers are required to enforce the CoC,
or not. The rather strong consensus was that they are not responsible,
but help is appreciated, as documented in this patch: c1d1ba844f01
("Code of conduct: Fix wording around maintainers enforcing the code
of conduct")

This was also acknowledged once more in a patch merged two years ago
with c1d1ba844f01 ("Code of conduct: Fix wording around maintainers
enforcing the code of conduct") by changing "decisions by the
committee" into "decisions regarding enforcement recommendations", to
make it very explicit that they're just recommendations to the TAB and
maintainers and that the CoC team does not have independent
enforcement powers.

The approval by the TAB is still here, but maintainers don't seem to
get a say anymore. Is this the intention, because it seems to be a
really substantial change? From our experience on the fd.o side, there
is a subset of maintainers who do not appreciate this responsibility
at all and very much would not like to have it. Given that, and the
kernel's strong consensus a few years ago against this I don't think
enlisting maintainers for enforcement without a wide agreement is
going to be well received - even when personally I think it's the
right approach to CoC enforcement, I did not put an ack on that patch
for clear reasons.

Also, if a maintainer refuses to implement an enforcement decision,
will they be sanctioned too? Since this is all an entirely new section
and does not touch any of the existing sections I'm also not clear on
when one or the other rules apply, and how they interact.

This part looks confusing to me, and a bit in a scary way.

Cheers, Sima


> +
> +The effectiveness of the remedial measure(s) approved by the TAB depends
> +on the trust and cooperation from the community, maintainers, sub-maintainers,
> +and kernel.org administrators in enforcing them.
> +
> +The Code of Conduct Committee sincerely hopes that unacceptable behaviors
> +that require seeking public apologies continue to be exceedingly rare
> +occurrences in the future.
> --
> 2.40.1
>
>


--
Daniel Vetter
Software Engineer, Intel Corporation
