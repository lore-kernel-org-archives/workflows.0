Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1027A904
	for <workflows@vger.kernel.org>; Fri,  9 Jan 2026 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976232; cv=none; b=DCY5u+ovX4R9nVtmu84Ty1ca6VLJ0WnilryPJacKUeIrj+HYUA4NDRLx3XrwA9C6Tv0JAeVzwquhPawr7tij6tsTzRvPC20AG5nUeJesum3Luw+AtSw1uUZri0L8uMIJvEwjqhvDd2D88yLYOP6y03OIiTm4GmyYycE3eJd0Rnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976232; c=relaxed/simple;
	bh=tGnqbLmOhP9isHiPxWN/XPpA61Oj201z3O7nsWOI7Sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5iTdX9XiSi44+iVEpHSD/l2M2e0PphIaC8J25vHjLH5b3SVr4W2LCMBzXnSJyf8oSOecLiPfrPQwyI9Nc5O5YRGC8/vHmuaq3R4/NWBDUC8XyqLuYFLEfJ61UpU9rNoHKqCkpTLShktbSbBgiu7Hj8SQD7tpvjM8Dzwn1/xLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O64EHh2b; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O64EHh2b"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-11f42e9733fso189318c88.0
        for <workflows@vger.kernel.org>; Fri, 09 Jan 2026 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767976230; x=1768581030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgVHrGpFOZu3o9W2smUjiAbx/IB6ia8N7DTDEB731Qg=;
        b=O64EHh2bybXOqUIA/b9y3HYmPxtjh+MvrIYyqVrpTUfvIfr9V2/NdE40yrH1VSs/zA
         mxEO8wr9lCCJbrdXDrRhbwEN34hZL/BVwMyWv4wrkri+8zAQvRL7o8zb5FokGUkiPiQv
         zCUqpVURdnx5WVF5abUFmua0pIKnCCV8+Ob6g0t0PfPQnTDtqk0PYBo14LtTYaOSzoKf
         sxSFvD7yhvGhEn7wDfJC8AnF7apPhy1dpKqJ5w5fOqZdnHS+ej8Mz9gHOyKu6g2iZPD5
         sZ5eg62glhOVR5b4MyxwySXcVFSKsyC/DZMwDKLHG8umAsO5HsDg8NUR8vfyKfyrOVgL
         baIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976230; x=1768581030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KgVHrGpFOZu3o9W2smUjiAbx/IB6ia8N7DTDEB731Qg=;
        b=ZNULmcFDpff4E4XKs+SM2Qbe3vli1wuwXqMJWCl7fdUJCWISITxxGuWnP4vvigj11V
         a1gUZoK0dcv02vLf56PwC0iUFjIv0S7uCW+GBbKUGMlvHkXjN5oiSKYFpJHTlq2DL/s+
         ZC8fP5YbJBvNfehu42ZZAaScG+aUwHE1kI9dPmzeDctFPoeJbrEsgFWUQCS7JNaWRTM9
         w+zi4gcdXBAltH4XWW0++AUDbt1TlypHl/GP9MrHNE0ROiSF5T7qpDE4mavs3/xsR37y
         LJ0GRGKC+aJjfh7O4m+Kes+JLG42xF+55eqWi8Yf+JQtrhljcP0y7wR+/rFsT5Qkgo5i
         Xthg==
X-Forwarded-Encrypted: i=1; AJvYcCUFw1mK/K6AL02qWuTnbKuwwaw9BItX+4h1o5PblFJ8zIQVw57Rg32rBAobuQ291W64dyMzLVH9si4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vOgd5MG5LtvweeXYHTWVMXuM+uM/+38TITRZMg/tCfJEamnr
	cnoCJPDfbxVjX1UigKQLHFIFPcV0ORPJlmWWEW64qB18KzXwC22/pJGG5ht3P+FtQfd102s851y
	/o71OemeuZolga4YomtBjAUa2j914CsQ=
X-Gm-Gg: AY/fxX4h38SfJ2tvfMIsgl1jnh6r60hzhp+ltCfTMZBW51SDLcN4smAzhnJzwtl9PgZ
	ckIo8W6WYREBJWgn3+wtA+aAUT/UvMFJ34h1fv1vMzLePYZdfNQAbi/9U4lV9Ko4mVMepAOxvvB
	GC9HcXEVBloypwF8PFHj76iswt+xAUL+/r3jvnJrTpmOaFrCxUe++ESH79W0gDQlAcRrfT6GRBv
	kxfVEYIbnQ/vSVdcETzBfzyfGkcOiyQ+MhI2hIuJEiXrTwWsAy163yPCXzB0UBF4mRV67XuG/kp
	ANtt+5ZRrDao4dpXr6iJyDL1YyV8zWel3IoyOfHZ9UjBP8LKakgs1AgSr7wakNLHZkrwadEdM/K
	mXW2Ew11PL76f
X-Google-Smtp-Source: AGHT+IFPnMs8tYXrKC6QRTGlKt5c3UHbQ20I+iMpQeJtUFKAL06cbpiGchT05O1IclG935flftNB9uOe0tl1k8An8q0=
X-Received: by 2002:a05:693c:2a11:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b17d336c9amr3307855eec.6.1767976229504; Fri, 09 Jan 2026
 08:30:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local> <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local> <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local> <aV_eiRqUsK2KWkww@laps>
 <CANiq72mw1bis7aE9b=Htx9=Sd9jZH1rJmew1xqhPiCWu=EyzPw@mail.gmail.com> <b7469e4e-d711-467f-839f-4a9688d25a23@lucifer.local>
In-Reply-To: <b7469e4e-d711-467f-839f-4a9688d25a23@lucifer.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 Jan 2026 17:30:17 +0100
X-Gm-Features: AZwV_Qi9VSP2AMrsmou5qnQmy5TBXFzhlEy2iJtX864Gee6M0-zqG561EpAZSLM
Message-ID: <CANiq72=yOkv_GK=V5k-WTYE-Fv++K+OtVUdrLQcH+75qRMN-Aw@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Sasha Levin <sashal@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	NeilBrown <neilb@ownmail.net>, "Theodore Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 8:28=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> 'You _can_ be more transparent by adding information like this:...'

I am not a native speaker, but my reading of that "can" was that it is
suggesting ways to be more transparent that may or may not apply in
particular cases, but the requirement of being transparent was already
established by the previous sentence:

    Second, when making a contribution, be transparent about
    the origin of content in cover letters and changelogs.

Which is reinforced by another imperative in the bullet point about prompts=
:

    If code was largely generated from a single or short set of
    prompts, include those prompts.

Similarly, I read those other "might"s you quote like a set of things
that could happen or not (and is not exhaustive) in particular cases
and/or depending on the maintainer etc.

At least that is my reading, and as far as I understood the TAB
discussions, the goal of this patch was to document that non-trivial
tool usage needs to be disclosed, including LLM use, and to me the
patch already did that, but perhaps the wording can be more direct.

I hope that clarifies a bit...

Cheers,
Miguel
