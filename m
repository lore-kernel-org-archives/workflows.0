Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A357D1531C8
	for <workflows@vger.kernel.org>; Tue, 13 Jan 2026 05:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768282258; cv=none; b=fPV4URW9JC1KNq4oj360hoTGS7fgL3Y5JL4q+Q6X/nDXmVIheSgwaaTogEcwlQXR7X4XUdvIZvUkqeWAqU7Ib7i6lfPgi2wTmDDUnYjvrSfOI/lSJRKKrSWJSv3bFO/hqip6d0zwTNGsyUIcgrWPP6cGc1USsM9M8x0llFQpkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768282258; c=relaxed/simple;
	bh=P/MHFzYAChsov3oSR/JHZIouogUq9c6RwFPwihfamrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdM6vrR9NCs3gDR9lqIdTFM/D1Uu8sj+fQu0J1KkXldnoAaEZ4Ps/9Vtbd6g2pC3rPb96oY0/F5Tp0TvnFXa0JHLp4OlDk7IUmqtrse77fnVFQ0lSs71YBlHUZYyitg2fXEEYWLMjUF6C3cWgmEkFx6jBFT4LnJzKr4bvgZIc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S29NfkqU; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S29NfkqU"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so56066175e9.3
        for <workflows@vger.kernel.org>; Mon, 12 Jan 2026 21:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768282255; x=1768887055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9MEnfqkiQJvWopDgU9OJmASAYD/D+Fi+9t27f121isA=;
        b=S29NfkqUYWJEk5jMRAjEOverW+xOfxpNHT15L9k1D9IeqgrxKm1iEjw1OPcyVL98E5
         uJNsn2ZySvsMZNXMkA8IU9sJlLV8sYoPGD1mvCzKOfzRgLSSEzbgVHyAbkxqAU5YEKyb
         X0jtDx+RbCgbjBxPbAsK14S2ljDL8+o2tq+VmnoOqYoWRKtM2Es1nby+xOuFU5PIXwEe
         jBz++BG1XfMc089smF8brI3h8DRa45yvhR9mskp8ZTkSzSShqvIRt39WSYHALsTvgX0H
         Er54ihPFiudMGsb6iynm622gjhk8e/5NgubBMBcKvNmQngJwwOk66p1TV2Rl4rpOOOhA
         PVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768282255; x=1768887055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MEnfqkiQJvWopDgU9OJmASAYD/D+Fi+9t27f121isA=;
        b=NYAW8sU71umEXTx+aLSJPgNSVTIqRr9s9NuojBkBesc6Op1vcmmSU23BEWs1l1bW4g
         PCX9rkiJ8DDTAYM7b1IzM6NlzN8vS6YUHJllgPY/cPaUC8mIpPFpaHefd8ev2/ZUWdkr
         hAgD8UPTDeYc/7Ehudo+MdP9G0mQrWw8jdvDx3F2jm2fVxTWj2sXzCgmg1WDt0h3RHWt
         ge5Mn7i8+XvekXxx5QUaYz3QpO0npnhaj77Su1Vgk8R9SDbYwk2NCGUKl4NTaVxAfZz+
         a0cATnaGo8ToYrBQOD9MZSw91eSqUoZhA7UXKdtncdOnDjCxgGC8kUr5tz0CBNoiGEGG
         NQwg==
X-Forwarded-Encrypted: i=1; AJvYcCULRMjrEob0xb8T2wirw4NmJcRXwSEN5AjBS+evzxLquOxBLrBfKQVn4+xQtdFKI/MIy0JDyVhtNrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWzAppQHOOzeO3ZFX8R06O976kHLifzr+6Ej6f6AYMRjCxRok
	M7AuqokyPoA+SW2Qn04pceP6htwUGH/R1AmxzVhKc7RzhWfjGCSguFL/yVX7Z2w3ya0=
X-Gm-Gg: AY/fxX698sfm/Vci32obb/OPzInwDAGZbZSCfMJ590TI1R/5cVn+IWgTKC5NfOYUGAC
	Y6jAIEVQecDpUQLF9uKD449FBmwKfCmuQGiVo93y2HY5AWtqEiO6n489dHCSRM47ibpwdotqd/L
	RDkkptDcHiv4P43WtrTeMN7jR2TGjJtwQjarddWy6eGZvAKWofwZAwJtdPHkZiDiSO+kGF+2uiP
	H3m64XPNMm0n3RHfI7yABbkak8XtYtk0HO+wpMHc40toMIPrBHNJSHc/1kd6t65esz2St2Xus/7
	z892yx0EKVyy7CYNT2ap3n6ZDRGb5V0RlPfzWRIdVvWwA5VmF9nJgyy/MYhRm4Kudwha0UuhKv8
	0FO6ZOsx5I0NC/Yr2rrDPdo3x45vKrGSzc+f/wo6dFltwtUxSEu9bDiISTKXh4zN1MJ8wudhV1f
	BwKsgtvajxRKKrW8pI
X-Google-Smtp-Source: AGHT+IGDp/W7TK/EM3kXAS4N1aHcAGGZUHegbj9ykfLRgCjS5whOFlSgKwlj8bJYWUxFP6D9YmAxuA==
X-Received: by 2002:a05:600c:1392:b0:477:9cdb:e336 with SMTP id 5b1f17b1804b1-47d84b369cfmr239854465e9.21.1768282255011;
        Mon, 12 Jan 2026 21:30:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm403001375e9.13.2026.01.12.21.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 21:30:54 -0800 (PST)
Date: Tue, 13 Jan 2026 08:30:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
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
Message-ID: <aWXYi35pu9IHf2eE@stanley.mountain>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113000612.1133427-1-dave.hansen@linux.intel.com>

On Mon, Jan 12, 2026 at 04:06:12PM -0800, Dave Hansen wrote:
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

Argh... Flip.  In context, that sounds even more sinister and
threatening than my over the top proposal.  We have to "defend"
everything?  "If you do so anyway" sounds like we're jumping to a
"per my last email" from the get go.  What about:

If tools permit you to generate a contribution automatically, expect
additional scrutiny in proportion to how much of it was generated.

Every kernel patch needs careful review from multiple people.  Please,
don't start the public review process until after you have carefully
reviewed the patches yourself.  If you don't have the necessary
expertise to review kernel code, consider asking for help first before
sending them to the main list.

Ideally, patches would be tested but we understand that that's not
always possible.  Be transparent about how confident we can be that the
changes don't introduce new problems and how they have been tested.

Bug reports especially are very welcome.  Bug reports are more likely
to be dealt with if they can be tied to the individual commit which
introduced them.  With new kinds of warnings, it is better to send
a few at a time at the start to see if they are a real issue or how
they can be improved.

regards,
dan carpenter

