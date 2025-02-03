Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D420B1FC
	for <workflows@vger.kernel.org>; Mon,  3 Feb 2025 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600848; cv=none; b=VXKNItV4Fn+JHsL820CZXMpDC5Tw3Ft/T8SbOBF5e/Tt6+OFvCwpWogYgBj/o9gaz/DGOPn0lIhTok5JgeyUqusqKfa0PeRQHtyrtY/wwxD+u5j+la9tBQ523HfRaqvaujlnEncGLx6eZ5/wkRVZmZ7wD4gZNDr+HlSVyjMFcbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600848; c=relaxed/simple;
	bh=NUNo3NhYnhAcG5khMMn5VjutURlg3iEBzA1e88Cuuw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A18WElvjJ1fnuBjSvogEG5I0rwXjB4/Kk6TmTrQeBOr+Ye6yqqH176XlvR3NGyhGGtkzR16sT4qsvR3RNIU1gqTe60xUc1TKSV836u+QRJJqXqwAQA5CVi4vzSTdg6+gq0SAxhg8+e4N8BtLQXXgVn7/HnfLAHJA06OOAkBKRIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MtFnnEAS; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MtFnnEAS"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4679b5c66d0so461501cf.1
        for <workflows@vger.kernel.org>; Mon, 03 Feb 2025 08:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738600846; x=1739205646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NUNo3NhYnhAcG5khMMn5VjutURlg3iEBzA1e88Cuuw0=;
        b=MtFnnEAS9AEamP2urUTMqrvk7Xlz0ZRdsZWm/ATko4GiJxePU4wRn18XqgcVIwjx7Y
         C5E0Bo6U9DtseSwkbSN6EkScpIS68WCkM1qcF7QZO2F6s6t5mvYUnc1sEEUQLyIRTUl3
         EAJ+07qPsOwKb3YXYvc+MvNUQgg4iew5T7HJYizjGlKTFjOSahfnNm2KnpXVPnU3awCk
         EWYfhtITD2ksoo/60sa4+8IFNVdgJuVHP7GjGTCSFqf+1nshyrwzuryx/cakwt2USqIr
         q+RUDYmlu1K3Ms4TfAlra0xYjS8JCIUGF4dPVI3G5i23cqFNoR1pAEtNPtCryZst/v01
         cOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600846; x=1739205646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUNo3NhYnhAcG5khMMn5VjutURlg3iEBzA1e88Cuuw0=;
        b=dLVM01UNQmanK6QpdG+nn7ACno3csawjYT3bvtCeKt0FqTg4OfBtaopc7VRGpf4Yy0
         o1uZAxAMyT+vTyb52jJvzayTrzDVR2uk6GIHccsqllBXPyV/GK4Uu2H3RhW5XwoFT/10
         nUbb77opnQHvm3WFReVOqesbKqYwEzV6yDTMvwlrKaM08CBWsSTknYb2wawvs7MtOHHc
         ZgEH2BmhjboIzGYxaehectjYTrm5iWdxg/4KC0ZXbhzNrtboDyESgKbHYgZyWtsKQm/R
         OX4l4gLycZ+mj+6fFwuN+zFrmF9VF/eaPaFxwHZrWdexaX2AOt6/Cm594b/PbzMpiV73
         A7pg==
X-Forwarded-Encrypted: i=1; AJvYcCXJByQnjiZppu4xOYHyGuQrFaf9cn4JefpqBDMw/uOGNqxd4qpRxzCrPpYRt6YcKhlx8JHnJtWQGpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLh7lnU0QtPQaUBZ71ulmzJjLXmzmHr/Orb7xAFf9Y8ke8Tu8U
	OVo4KXE2OxBOP78SxT28TECXbTSSgJ1xcY7B9TktzeyfWfmVf04o91MarjJ202iqT14xCsaAVBj
	YcylBHgMzrB1OnMnzr5EDn4aDNdEoeBmWY+dHVsLoMG7KnsuF/Y49
X-Gm-Gg: ASbGncv8mb2cLbGVl/ew0ZuD5j1ozfAY4uDDyon7u0ixRft/Wva9bVyVeeq9Z4g33Iu
	+iWWtIHp3V3jVWl8x7wpejN8ENtGBXrt33QaWfTryDeuYGN3v493KXhLPcAAXuqByD7Ly0gtJCt
	kq87jaQtYmnb/6wWXkrZXNJ6jYk+k=
X-Google-Smtp-Source: AGHT+IEpbNGl2X3WCVlXhe7KrYcZy8phj2cHoKoZDux2ZkaYKFC6qeVBee7oTEU+L57MXVCpruKv6HjiU2sEl5SE2fo=
X-Received: by 2002:ac8:5ace:0:b0:466:a22a:6590 with SMTP id
 d75a77b69052e-4701832bd9emr129731cf.9.1738600845697; Mon, 03 Feb 2025
 08:40:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
In-Reply-To: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 3 Feb 2025 17:40:34 +0100
X-Gm-Features: AWEUYZmykqhW41Y-kitpSXHYpdsn6L85yKufn_KPSpUDrPneHWGed1oTMqbK_gc
Message-ID: <CA+i-1C3=9i92oA8T3H66DixY9b5A1y4oG5a5jcSn2aOD7CbDfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] checkpatch: Add support for checkpatch-ignore note
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 16:33, Brendan Jackman <jackmanb@google.com> wrote:
> Changes in v2:
> - Switched to the "graveyard" instead of the actual commit message.
> - Link to v1: https://lore.kernel.org/r/20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com

Hi Joe & Andy, any thoughts on this?
