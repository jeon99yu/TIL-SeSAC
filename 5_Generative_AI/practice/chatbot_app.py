import os
import streamlit as st
from dotenv import load_dotenv
from openai import OpenAI
from langchain_openai import ChatOpenAI
from langchain_core.prompts import PromptTemplate
from langchain_core.output_parsers import StrOutputParser

load_dotenv()

client = OpenAI(api_key=os.environ['OPENAI_API_KEY'])
llm = ChatOpenAI(model_name="gpt-4o", temperature=0)

# 프롬프트 설정
PROMPTS = {
    "기본": PromptTemplate.from_template("{question}의 질문에 답변해주세요."),
    "SNS 게시글": PromptTemplate.from_template("{question}의 내용을 요약해서 간단한 SNS 게시글을 작성해주세요."),
    "요약": PromptTemplate.from_template("{question}에 대해서 3문장 이내로 요약해주세요."),
}

#### 대시보드 디자인 설정 ####
with st.sidebar:
    if st.button('대화 초기화'):
        st.session_state.messages = []
        st.success("대화가 초기화되었습니다.")

    selected_prompt_name = st.selectbox('프롬프트를 선택하세요', list(PROMPTS.keys()), key="prompt_selector")
    st.session_state.current_prompt_template = PROMPTS[selected_prompt_name]

st.title('👾 나의 Chat-bot')
#### 대시보드 디자인 설정 ####

st.chat_message('user').write('User의 입력')
st.chat_message('ai').write('AI의 입력')

# 세션 초기화
if 'messages' not in st.session_state:
    st.session_state.messages = []

# 채팅기록 loads
for message in st.session_state.messages:
    if message['content']:
        with st.chat_message(message['role']):
            st.write(message['content'])

# 입력창
user_input = st.chat_input('내용을 입력하세요')

if user_input:
    st.session_state.messages.append({"role": "user", "content": user_input})
    with st.chat_message("user"):
        st.write(user_input)

    with st.chat_message("ai"):
        placeholder = st.empty()
        response = ""
        chain = st.session_state.current_prompt_template | llm | StrOutputParser()

        for chunk in chain.stream({"question": user_input}):
            response += chunk
            placeholder.write(response)

        placeholder.write(response)

        if response:
            st.session_state.messages.append({"role": "ai", "content": response})
