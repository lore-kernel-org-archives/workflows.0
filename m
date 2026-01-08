Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187A2D9484;
	Thu,  8 Jan 2026 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767890573; cv=none; b=RHoop6pffNnU/VnqhOP/EA6jQJo/Uqo2Q+wkna4JkpYp37gk8c12/5MEHOP1CYCKXfUC+cDuz23Rtwkao8lRlMaa1Grp7mOqmErYnTF9GZU5wQBYBZVzyaoDoT7Epvl29f/NaVZ+NBq4hj90JGJSjCMvedFM5rCs1/QIdemM6Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767890573; c=relaxed/simple;
	bh=7g/qn3HJo7UDfxp/KGwMbdI9cP+m/FqFnOAO9zbDh1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va9gfKmiJ8YmIoDd9ojhcgQpNU1Q8+yKVyIPCeLJpBZH13Iwfk8d5V/+wfzGqfZ3UQilrEm57CSLf8ucAUkyYVeGDIkLsrlhaz26VxMhERlPHSh9L+hypN6YSMTFhIX9pfsqnWfo9wXNkmMaE81NNmhHse8/7YiSpsBBwcjgA/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ac7nGGlc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ac7nGGlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4612C116C6;
	Thu,  8 Jan 2026 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767890571;
	bh=7g/qn3HJo7UDfxp/KGwMbdI9cP+m/FqFnOAO9zbDh1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ac7nGGlcTSpcptTfc2N9shh3Ntd5PNwTbqPLhmNqjJaPOh7MREhqzeX8MBSeAMMSV
	 jA3pS5155Zz0gNRqh/VTQrBJtL4H3lP7E2OsVNmbCJ4rGD3yggDc/9kyZEWQAVwH8z
	 sJQ8rEUWi/3QyKhbHFyaSSNz9hvUfZlC7siB7IxEyAxZVxWC7NkCePMXM6Mv4CVPfx
	 Swr2f5kzseI4pKQqQtKs1+zH1y5Ji8fysvVKMfe5KCq/SbAGq4IorYIGDXHpf2HIHz
	 xud59Z2E0S0siv4InH5sLSEiSwymd10J9T/tuSEjz6Vb8T/sB/XtdNdzvg76hBwMeq
	 3hyNTqpnq9tOw==
Date: Thu, 8 Jan 2026 11:42:49 -0500
From: Sasha Levin <sashal@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aV_eiRqUsK2KWkww@laps>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>

On Thu, Jan 08, 2026 at 11:56:19AM +0000, Lorenzo Stoakes wrote:
>diff --git a/Documentation/process/generated-content.rst b/Documentation/process/generated-content.rst
>index 917d6e93c66d..1423ed9d971d 100644
>--- a/Documentation/process/generated-content.rst
>+++ b/Documentation/process/generated-content.rst
>@@ -95,3 +95,11 @@ choose how they handle the contribution. For example, they might:
>  - Ask the submitter to explain in more detail about the contribution
>    so that the maintainer can feel comfortable that the submitter fully
>    understands how the code works.
>+
>+If tools permit you to generate series entirely automatically, expect
>+additional scrutiny.
>+
>+As with the output of any tooling, maintainers will not tolerate 'slop' -

Could you define what "slop" in the context of a kernel patch means? Clearly
it's not just innocent error, but it's not clear to me what line needs to be
crossed for a mistake to turn into "slop".

>+you are expected to understand and to be able to defend everything you
>+submit. If you are unable to do so, maintainers may choose to reject your
>+series outright.

We already have something like this in Documentation/process/howto.rst:

   "Before making any actual modifications to the Linux kernel code, it is
    imperative to understand how the code in question works."

I suppose that we can restate the same here, but whats the purpose? to put it
in front of whatever media outlets might be looking?

-- 
Thanks,
Sasha
